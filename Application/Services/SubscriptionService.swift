//
//  SubscriptionService.swift
//  TestAssist
//
//  Created by Diachenko Ihor on 01.06.2023.
//

import Foundation
import StoreKit
import Combine

typealias RenewalState = StoreKit.Product.SubscriptionInfo.RenewalState

protocol SubscriptionsUseCase {
    func requestProduct() -> AnyPublisher<Product?, Error>
    func purchase(_ product: Product) -> AnyPublisher<Transaction?, Error>
}

final class SubscriptionsService: SubscriptionsUseCase {
    
    private enum C {
        static let productId: String = "subscription.monthly"
    }
    
    // MARK: - Properties
    private(set) var subscriptions = CurrentValueSubject<[Product], Never>([])
    private(set) var purchasedSubscriptions = CurrentValueSubject<[Product], Never>([])
    private(set) var subscriptionGroupStatus: RenewalState?
    var updateListenerTask: Task<Void, Error>? = nil
    
    init() {
        updateListenerTask = listenForTransactions()
    }
    
    deinit {
        updateListenerTask?.cancel()
    }
    
    private func listenForTransactions() -> Task<Void, Error> {
        Task.detached {
            for await result in Transaction.updates {
                do {
                    let transaction = try self.checkVerified(result)
                    await self.updateCustomerProductStatus()
                    await transaction.finish()
                } catch {
                    throw StoreError.failedVerification
                }
            }
        }
    }
    
    func requestProduct() -> AnyPublisher<Product?, Error> {
        Future<Product?, Error> { promise in
            Task {
                do {
                    let product = try await Product.products(for: [C.productId]).first
                    promise(.success(product))
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    func purchase(_ product: Product) -> AnyPublisher<Transaction?, Error> {
        Future<Transaction?, Error> { [unowned self] promise in
            Task {
                do {
                    let result = try await product.purchase()
                    switch result {
                    case .success(let verification):
                        let transaction = try checkVerified(verification)
                        await updateCustomerProductStatus()
                        await transaction.finish()
                        promise(.success(transaction))
                    default:
                        promise(.success(nil))
                    }
                } catch {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    private func updateCustomerProductStatus() async {
        for await result in Transaction.currentEntitlements {
            do {
                let transaction = try checkVerified(result)
                switch transaction.productType {
                case .autoRenewable:
                    if let subscription = subscriptions.value.first(where: {$0.id == transaction.productID}) {
                        purchasedSubscriptions.value.append(subscription)
                    }
                default:
                    break
                }
                await transaction.finish()
            } catch {
                print("failed updating products")
            }
        }
    }
    
    private func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified:
            throw StoreError.failedVerification
        case .verified(let safe):
            return safe
        }
    }
}

enum StoreError: Error {
    case failedVerification
}

//
//  MainVM.swift
//  TestAssist
//
//  Created by Diachenko Ihor on 24.05.2023.
//

import UIKit
import Combine
import StoreKit

final class MainVM {
    
    // MARK: - Properties
    let useCases: SubscriptionsUseCase
    let guideStep = CurrentValueSubject<GuideStep, Never>(.introduction)
    let product = CurrentValueSubject<Product?, Never>(nil)
    var cancellable = Set<AnyCancellable>()
    
    // MARK: - Life Cycle
    init(useCases: SubscriptionsUseCase) {
        self.useCases = useCases
        
        useCases.requestProduct()
            .sink(receiveCompletion: { result in
                guard case .failure(let error) = result else { return }
                print(error)
            }, receiveValue: { [unowned self] product in
                self.product.send(product)
            })
            .store(in: &cancellable)
    }
    
    deinit {
        cancellable.forEach {
            $0.cancel()
        }
    }
    
    func buy(product: Product) {
        useCases.purchase(product)
            .sink { result in
                guard case .failure(let error) = result else { return }
                print(error)
            } receiveValue: { _ in }
            .store(in: &cancellable)
    }
}

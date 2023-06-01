//
//  Coordinator.swift
//  TestAssist
//
//  Created by Diachenko Ihor on 24.05.2023.
//

import UIKit

typealias UseCases = SubscriptionsUseCase

protocol Coordinator: AnyObject {
    var useCases: UseCases { get }
    
    func start()
    func stop()
}

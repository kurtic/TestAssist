//
//  MainFactory.swift
//  TestAssist
//
//  Created by Diachenko Ihor on 24.05.2023.
//

import Foundation

final class MainFactory: BaseFactory {
    static var main = MainFactory()
    private override init() {}
    
    func makeMainVC<T: Coordinator>(coordinator: T) -> MainVC {
        makeController(coordinator) {
            $0.viewModel = MainVM(useCases: coordinator.useCases)
        }
    }
}

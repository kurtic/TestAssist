//
//  AppCoordinator.swift
//  TestAssist
//
//  Created by Diachenko Ihor on 24.05.2023.
//

import UIKit

final class AppCoordinator: Coordinator {
    var useCases: UseCases
    
    
    // MARK: - Properties
    let window = UIWindow(frame: UIScreen.main.bounds)
    
    // MARK: - Private Properties
    private lazy var navigationController = UINavigationController()
    
    // MARK: - Life Cycle
    init(useCases: UseCases) {
        self.useCases = useCases
    }
    
    func start() {
        navigationController.viewControllers = [MainFactory.main.makeMainVC(coordinator: self)]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func stop() {}
}

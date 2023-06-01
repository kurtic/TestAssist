//
//  AppDelegate.swift
//  TestAssist
//
//  Created by Diachenko Ihor on 23.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private lazy var appCoordinator = AppCoordinator(useCases: SubscriptionsService())

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = appCoordinator.window
        appCoordinator.start()
        return true
    }
}

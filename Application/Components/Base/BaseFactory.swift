//
//  BaseFactory.swift
//  TestAssist
//
//  Created by Diachenko Ihor on 24.05.2023.
//

import UIKit

class BaseFactory {
    func makeController<T: Makeable>(_ coordinator: Coordinator, _ builder: T.Builder) -> T
        where T.Value == T, T: UIViewController {
        let controller: T = T.make(builder)
        return controller
    }
}

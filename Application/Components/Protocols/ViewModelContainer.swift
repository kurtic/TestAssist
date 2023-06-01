//
//  ViewModelContainer.swift
//  TestAssist
//
//  Created by Diachenko Ihor on 01.06.2023.
//

import Foundation

protocol ViewModelContainer: AnyObject {
    associatedtype ViewModel
    var viewModel: ViewModel { get set }
}

private enum ViewModelContainerKeys {
    static var viewModel = "viewModel"
}

extension ViewModelContainer where Self: NSObject {
    var viewModel: ViewModel {
        get {
            getAssociatedObject(key: &ViewModelContainerKeys.viewModel)!
        }
        set {
            let viewModel: ViewModel? = getAssociatedObject(key: &ViewModelContainerKeys.viewModel)
            assert(viewModel == nil, "\(type(of: self)) doesn't support reusable viewModel. Use ReusableViewModelContainer instead.")
            setAssociatedObject(value: newValue, key: &ViewModelContainerKeys.viewModel, policy: .retain)
        }
    }
}

//
//  UICollectionView+Utils.swift
//  TestAssist
//
//  Created by Diachenko Ihor on 27.05.2023.
//

import UIKit

extension UICollectionView {
    func registerNibs<T>(for cellClasses: [T.Type]) where T: UICollectionViewCell {
        for cellClass in cellClasses {
            let identifier = String(describing: cellClass)
            register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        }
    }
    
    func registerNib<T>(for cellClass: T.Type) where T: UICollectionViewCell {
        let identifier = String(describing: cellClass)
        register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
}

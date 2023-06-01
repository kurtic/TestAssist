//
//  UIView+Utils.swift
//  TestAssist
//
//  Created by Diachenko Ihor on 28.05.2023.
//

import UIKit

extension UIView {
    @IBInspectable var viewCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

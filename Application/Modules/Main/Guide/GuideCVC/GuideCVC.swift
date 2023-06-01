//
//  GuideCVC.swift
//  TestAssist
//
//  Created by Diachenko Ihor on 24.05.2023.
//

import UIKit

final class GuideCVC: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var guideImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    // MARK: - Configure
    func configure(with step: GuideStep) {
        guideImageView.image = step.image
        titleLabel.text = step.title
        subtitleLabel.attributedText = step.subtitle
    }
}

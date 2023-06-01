//
//  guideStep.swift
//  TestAssist
//
//  Created by Diachenko Ihor on 31.05.2023.
//

import UIKit

enum GuideStep: Int, CaseIterable {
    case introduction
    case getAssistance
    case perfectCopy
    case aiCapabilities
    
    var image: UIImage {
        switch self {
        case .introduction:
            return R.image.guide1()!
        case .getAssistance:
            return R.image.guide2()!
        case .perfectCopy:
            return R.image.guide3()!
        case .aiCapabilities:
            return R.image.guide4()!
        }
    }
    
    var isRestorePurchaseViewHidden: Bool {
        self != .aiCapabilities
    }
    
    var title: String {
        switch self {
        case .introduction:
            return "Your Personal\nAssistant"
        case .getAssistance:
            return "Get assistance\nwith any topic"
        case .perfectCopy:
            return "Reflect copy\nyou can rely on"
        case .aiCapabilities:
            return "Upgrade for Unlimited AI Capabilities"
        }
    }
    
    var subtitle: NSAttributedString {
        let resultString: NSMutableAttributedString
        let attributes: [NSAttributedString.Key : Any] = [.foregroundColor: R.color.lightGray() as Any,
                                                          .font: R.font.sfProDisplayMedium(size: 17) as Any]
        switch self {
        case .introduction:
            resultString = .init(string: "Simplify your life\nwith an AI companion", attributes: attributes)
        case .getAssistance:
            resultString = .init(string: "From daily tasks to complex queries, we’ve got you covered", attributes: attributes)
        case .perfectCopy:
            resultString = .init(string: "Generate professional texts effortlessly", attributes: attributes)
        case .aiCapabilities:
            let attrString = NSMutableAttributedString(string: "7-Day Free Trial, \n then $19.99 /month, auto-renewable", attributes: attributes)
            let range = (attrString.string as NSString).range(of: "$19.99")
            attrString.addAttributes([.font: R.font.sfProDisplayBold(size: 16) as Any, .foregroundColor: UIColor.white] , range: range)
            resultString = attrString
        }
        return resultString
    }
    
    var buttonTitle: String {
        switch self {
        case .introduction, .getAssistance, .perfectCopy:
            return "Continue"
        case .aiCapabilities:
            return "Try Free & Subscribe"
        }
    }
    
    var isHidePageControl: Bool {
        self == .aiCapabilities || self == .introduction
    }
}

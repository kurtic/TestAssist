//
//  MainVC.swift
//  TestAssist
//
//  Created by Diachenko Ihor on 24.05.2023.
//

import UIKit
import Combine

extension MainVC: Makeable {
    static func make() -> MainVC { R.storyboard.main.mainVC()! }
}

final class MainVC: UIViewController, ViewModelContainer {
    
    typealias ViewModel = MainVM
    
    enum C {
        static let cellHeightScale: CGFloat = 0.7
        static let cellWidthScale: CGFloat = 0.85
        static let privacyPolicyText = "By continuing you accept our:\nTerms of Use, Privacy Policy and Subscription Terms"
        static let highLightedWords = ["Terms of Use", "Privacy Policy", "Subscription Terms"]
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var restorePurchaseView: UIView!
    @IBOutlet private weak var continueButton: UIButton!
    @IBOutlet private weak var privacyPolicyLabel: UILabel!
    @IBOutlet private weak var pageControlStackView: UIStackView!
    @IBOutlet private var pageControltemImages: [UIImageView]!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.registerNib(for: GuideCVC.self)
        setupCollectionViewLayout()
        setupPrivacyPolicyLabel()
        bindings()
    }
    
    private func bindings() {
        viewModel.guideStep.sink { [unowned self] step in
            self.restorePurchaseView.isHidden = step.isRestorePurchaseViewHidden
            self.continueButton.setTitle(step.buttonTitle, for: .normal)
            self.setupPageControlItems(with: step.rawValue)
            self.pageControlStackView.isHidden = step.isHidePageControl
            privacyPolicyLabel.isHidden = !step.isHidePageControl
        }.store(in: &viewModel.cancellable)
    }
    
    // MARK: - Setup UI
    private func setupPageControlItems(with activeTypeIndex: Int) {
        self.pageControltemImages.forEach {
            $0.image = $0.tag == activeTypeIndex ? R.image.icActivePage() : R.image.icUnActivePage()
        }
    }
    
    private func setupPrivacyPolicyLabel() {
        let attrString = NSMutableAttributedString(string: C.privacyPolicyText,
                                                   attributes: [.font: R.font.sfProDisplayRegular(size: 12) as Any,                                                              .foregroundColor: R.color.darkGray() as Any])
        
        C.highLightedWords.forEach {
            let range = (attrString.string as NSString).range(of: $0)
            attrString.addAttribute(.foregroundColor, value: R.color.blue() as Any, range: range)
        }
        
        privacyPolicyLabel.attributedText = attrString
    }
    
    private func setupCollectionViewLayout() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let screenSize = UIScreen.main.bounds.size
        
        let cellWidth = floor(screenSize.width * C.cellWidthScale)
        let cellHeight = floor(screenSize.height * C.cellHeightScale)
        let xInset = (view.bounds.width - cellWidth) / 2
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        layout.minimumLineSpacing = 16
        collectionView.contentInset = UIEdgeInsets(top: 0, left: xInset, bottom: 0, right: xInset)
        collectionView.collectionViewLayout = layout
    }
    
    // MARK: - IBActions
    @IBAction private func continueTapped(_ sender: Any) {
        if (viewModel.guideStep.value.rawValue + 1) < GuideStep.allCases.count {
            let nextTypeIndex = viewModel.guideStep.value.rawValue + 1
            viewModel.guideStep.value = .init(rawValue: nextTypeIndex) ?? .introduction
            collectionView.scrollToItem(at: IndexPath(item: nextTypeIndex,
                                                      section: .zero), at: .centeredHorizontally, animated: true)
        } else {
            guard let product = viewModel.product.value else { return }
            viewModel.buy(product: product)
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSourc
extension MainVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        GuideStep.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: GuideCVC.self), for: indexPath) as? GuideCVC,
              let guideType = GuideStep(rawValue: indexPath.item) else { return UICollectionViewCell() }
        cell.configure(with: guideType)
        return cell
    }
}

//
//  ShowListButton.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 8.08.2023.
//

import UIKit

class ShowListButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    private func setupView() {
        guard let logoImage = UIImage(named: Constants.imageNameValue) else { return }
        
        self.setBackgroundImage(logoImage, for: .normal)
    }
}

extension ShowListButton {
    private struct Constants {
        static let imageNameValue = "ListButtonImage"
    }
}

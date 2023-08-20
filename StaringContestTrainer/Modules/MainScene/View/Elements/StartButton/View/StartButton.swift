//
//  StartButton.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 16.08.2023.
//

import UIKit

class StartButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupView() {
        #warning("Setting up propeties here")
    }
    
    func setup(with model: StartButtonViewModelType) {
        self.model = model

        setTitle(model.title, for: .normal)
        
        model.runtimeState.subscribe(self, closure: extractSelf { sSelf, data in
            print("Countdown state did set to \(data.newValue ? "active" : "inactive")")
        })
    }
    
    private var model: StartButtonViewModelType?
    
    private var indicatorLayer: CAShapeLayer?
}

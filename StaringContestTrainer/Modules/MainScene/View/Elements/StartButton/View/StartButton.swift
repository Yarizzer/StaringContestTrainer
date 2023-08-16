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
        self.mainTitle = UILabel()
    }
    
    func setup(with model: StartButtonViewModelType) {
        self.model = model
        
        guard let mainTitle else { return }
        
        mainTitle.text = model.title
        
        model.didChangedState.subscribe(self, closure: extractSelf { sSelf, _ in
            guard let newState = sSelf.model?.countDownState else { return }
            
            switch newState {
            case .active: writeLog(type: .info, message: "Countdown state did set to active")
            case .inactive: writeLog(type: .info, message: "Countdown state did set to inactive")
            }
        })
    }
    
    
    private var model: StartButtonViewModelType?
    
    private var mainTitle: UILabel?
}

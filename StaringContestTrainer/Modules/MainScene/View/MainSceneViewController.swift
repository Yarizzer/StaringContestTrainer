//
//  MainSceneViewController.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 7.08.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class MainSceneViewController: BaseViewController<MainSceneInteractable> {
	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
	}
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: Constants.initialAD, delay: 0, options: [.curveEaseOut, .allowUserInteraction], animations: extractSelf { sSelf in
            sSelf.topPaddingConstraint.constant -= Constants.topConstraintExtraValue
            sSelf.view.layoutIfNeeded()
        }, completion: extractSelf { sSelf, _ in
            writeLog(type: .info, message: "View has been prepared")
//            sSelf.interactor?.makeRequest(requestType: .viewIsReady)
        })
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        topPaddingConstraint.constant = AppCore.shared.uiLayer.device.topPaddingValue + Constants.topConstraintExtraValue
    }
	
	private func setup() {
        topPaddingConstraint.constant = AppCore.shared.uiLayer.device.topPaddingValue + Constants.topConstraintExtraValue
        
		interactor?.makeRequest(requestType: .initialSetup)
	}
    
    @IBAction private func showListButtonAction(_ sender: ShowListButton) {
        
    }
    
    @IBOutlet private weak var topPaddingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var sceneTitle: UILabel!
}

extension MainSceneViewController: MainSceneViewControllerType {
	func update(viewModelDataType: MainSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
			print("\(self) \(#function) with model instance \(model)")
		}
	}
}

extension MainSceneViewController {
	private struct Constants {
        //Animation duration
        static let initialAD: Double = 0.5
        //Constraints
        static let topConstraintExtraValue: CGFloat = 20.0
	}
}

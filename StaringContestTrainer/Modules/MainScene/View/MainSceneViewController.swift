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
            sSelf.interactor?.makeRequest(requestType: .viewIsReady)
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        interactor?.makeRequest(requestType: .viewWillDisappear)
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
        interactor?.makeRequest(requestType: .showHideListView)
    }
    
    @IBAction private func startButtonAction(_ sender: StartButton) {
        interactor?.makeRequest(requestType: .startButtonDidTapped)
    }
    
    @IBOutlet private weak var topPaddingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var listViewTrailingConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var sceneTitle: UILabel!
    @IBOutlet private weak var trainingListView: TrainingListView!
    @IBOutlet private weak var captureView: CaptureView!
    @IBOutlet private weak var startButton: StartButton!
}

extension MainSceneViewController: MainSceneViewControllerType {
	func update(viewModelDataType: MainSceneViewControllerViewModel.ViewModelDataType) {
		switch viewModelDataType {
		case .initialSetup(let model):
            trainingListView.setup(with: model.getTrainingListViewModel())
            captureView.setup(with: model.getCaptureViewModel())
            startButton.setup(with: model.getStartButtonViewModel())
        case .showHideListView:
            view.layoutIfNeeded()
            
            UIView.animate(withDuration: Constants.listViewAD, delay: 0, options: [.allowUserInteraction], animations: extractSelf { sSelf in
                sSelf.listViewTrailingConstraint.constant = sSelf.listViewTrailingConstraint.constant == 0.0 ? Constants.listViewTrailingConstraintExtraValue : 0.0
                
                sSelf.view.layoutIfNeeded()
            })
        case .viewIsReady: captureView.awakeSession()
        case .viewWillDisappear: captureView.sleepSession()
		}
	}
}

extension MainSceneViewController {
	private struct Constants {
        //Animation duration
        static let initialAD: Double = 0.5
        static let listViewAD: Double = 0.5
        //Constraints
        static let topConstraintExtraValue: CGFloat = 20.0
        static let listViewTrailingConstraintExtraValue: CGFloat = -AppCore.shared.uiLayer.device.screenSize.width / 3 * 2 - 10
	}
}

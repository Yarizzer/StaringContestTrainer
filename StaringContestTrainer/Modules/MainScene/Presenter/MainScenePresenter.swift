//
//  MainScenePresenter.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 7.08.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

class MainScenePresenter {
	init(for view: MainSceneViewControllerType, service: MainScenePresenterServiceType) {
		self.viewController = view
		self.service = service
	}
	
	private var viewController: MainSceneViewControllerType?
	private let service: MainScenePresenterServiceType
}

extension MainScenePresenter: MainScenePresentable {
	func response(responseType: MainScenePresenterResponse.MainSceneResponseType) {
		let model = service.model
		
		switch responseType {
		case .initialSetup: viewController?.update(viewModelDataType: .initialSetup(with: model))
    case .showHideListView: viewController?.update(viewModelDataType: .showHideListView)
    case .viewIsReady: viewController?.update(viewModelDataType: .viewIsReady)
    case .viewWillDisappear: viewController?.update(viewModelDataType: .viewWillDisappear)
		case .drainView: viewController = nil
		}
	}
}

//
//  MainSceneInteractorService.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 7.08.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol MainSceneInteractorServiceType{
  func startButtonDidTapped()
}

class MainSceneInteractorService {
	init(withModel model: MainSceneViewModelType) {
		self.viewModel = model
	}
	
	private let viewModel: MainSceneViewModelType
}

extension MainSceneInteractorService: MainSceneInteractorServiceType {
  func startButtonDidTapped() { viewModel.startButtonDidTapped() }
}

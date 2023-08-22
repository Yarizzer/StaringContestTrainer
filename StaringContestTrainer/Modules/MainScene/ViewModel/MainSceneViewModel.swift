//
//  MainSceneViewModel.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 7.08.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol MainSceneViewModelType {
  func getTrainingListViewModel() -> TrainingListViewModelType
  func getCaptureViewModel() -> CaptureViewModelType
  func getStartButtonViewModel() -> StartButtonViewModelType
  
  func startButtonDidTapped()
}

class MainSceneViewModel {
  init() {
    self.startButtonViewModel = StartButtonViewModel()
  }
  
  private var startButtonViewModel: StartButtonViewModelType
}

extension MainSceneViewModel: MainSceneViewModelType {
  func getTrainingListViewModel() -> TrainingListViewModelType { TrainingListViewModel() }
  func getCaptureViewModel() -> CaptureViewModelType { CaptureViewModel() }
  func getStartButtonViewModel() -> StartButtonViewModelType { startButtonViewModel }
  
  func startButtonDidTapped() {
    startButtonViewModel.switchState()
  }
}

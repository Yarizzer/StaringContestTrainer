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
}

class MainSceneViewModel { }

extension MainSceneViewModel: MainSceneViewModelType {
    func getTrainingListViewModel() -> TrainingListViewModelType { TrainingListViewModel() }
    func getCaptureViewModel() -> CaptureViewModelType { CaptureViewModel() }
}

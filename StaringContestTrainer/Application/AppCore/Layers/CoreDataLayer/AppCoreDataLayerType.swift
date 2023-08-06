//
//  AppCoreDataLayerType.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

protocol AppCoreDataLayerType {
    //MARK: - Session
    func prepareSession()
    //MARK: - Publishers
    var trainingList: Publisher<[TrainingModel]?> { get }
}

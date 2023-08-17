//
//  StartButtonViewModelType.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 16.08.2023.
//

protocol StartButtonViewModelType {
    //MARK: - Publisher's
    var runtimeState: Publisher<Bool> { get }
    
    var title: String { get }
    func switchState()
}

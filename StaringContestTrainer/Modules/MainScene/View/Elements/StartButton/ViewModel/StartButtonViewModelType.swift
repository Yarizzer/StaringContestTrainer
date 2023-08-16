//
//  StartButtonViewModelType.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 16.08.2023.
//

typealias StartButtonCountdownState = Bool.Type
//enum StartButtonCountdownState {
//    case active, inactive
//}

protocol StartButtonViewModelType {
    //MARK: - Publisher's
    var didChangedState: Publisher<Bool?> { get }
    
    var countDownState: StartButtonCountdownState? { get }
    var title: String { get }
    
    func switchState()
}

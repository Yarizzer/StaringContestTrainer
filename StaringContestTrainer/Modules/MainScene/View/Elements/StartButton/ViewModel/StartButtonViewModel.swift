//
//  StartButtonViewModel.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 16.08.2023.
//

class StartButtonViewModel {
    
    //MARK: - Publisher's
    var didChangedState: Publisher<Bool?> = Publisher(nil)
    
    private var state: StartButtonCountdownState? {
        didSet {
            didChangedState.value = true
        }
    }
}

extension StartButtonViewModel: StartButtonViewModelType {
    var countDownState: StartButtonCountdownState? { state }
    var title: String { Constants.titleValue }
    
    func switchState() {
        state = true
    }
}

extension StartButtonViewModel {
    private struct Constants {
        static let titleValue = "Start"
        static let countDownValue: Double = 3.0
    }
}

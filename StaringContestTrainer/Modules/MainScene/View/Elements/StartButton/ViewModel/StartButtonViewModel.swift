//
//  StartButtonViewModel.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 16.08.2023.
//

class StartButtonViewModel {
    init() {
        runtimeState = Publisher(Constants.initialStateValue)
    }
    //MARK: - Publisher's
    var runtimeState: Publisher<Bool>
}

extension StartButtonViewModel: StartButtonViewModelType {
    var title: String { Constants.titleValue }
    
    func switchState() {
        runtimeState.value.toggle()
    }
}

extension StartButtonViewModel {
    private struct Constants {
        static let titleValue = "Start"
        static let countDownValue: Double = 3.0
        static let initialStateValue = false
    }
}

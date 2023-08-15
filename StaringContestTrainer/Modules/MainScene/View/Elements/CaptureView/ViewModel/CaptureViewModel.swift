//
//  CaptureViewModel.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 10.08.2023.
//

import CoreImage

class CaptureViewModel {
    //MARK: - Subscription
    func subscribe() {
        AppCore.shared.ciProcessorLayer.state.subscribe(self) { [weak self] data in
            guard let currentState = data.newValue else { return }
            
            switch currentState {
            case .started: writeLog(type: .info, message: "Session have been started")
            case .finished: writeLog(type: .info, message: "Session have been finished")
            }
        }
    }
}

extension CaptureViewModel: CaptureViewModelType {
    //MARK: - func
    func start() {
        AppCore.shared.ciProcessorLayer.start()
    }
    func check(image: CIImage) {
        AppCore.shared.ciProcessorLayer.process(image: image)
    }
}

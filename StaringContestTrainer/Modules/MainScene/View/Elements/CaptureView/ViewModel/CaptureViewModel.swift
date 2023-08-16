//
//  CaptureViewModel.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 10.08.2023.
//

import CoreImage

class CaptureViewModel {
    
}

extension CaptureViewModel: CaptureViewModelType {
    //MARK: - func
    func check(image: CIImage) {
        print(AppCore.shared.ciProcessorLayer.process(image: image))
    }
}

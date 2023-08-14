//
//  CaptureViewModel.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 10.08.2023.
//

import CoreImage

class CaptureViewModel: CaptureViewModelType {
    func check(image: CIImage) {
        AppCore.shared.ciProcessorLayer.process(image: image)
    }
}

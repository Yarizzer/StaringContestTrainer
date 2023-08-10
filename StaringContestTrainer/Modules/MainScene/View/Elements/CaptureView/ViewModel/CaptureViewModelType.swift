//
//  CaptureViewModelType.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 10.08.2023.
//

import AVFoundation

protocol CaptureViewModelType {
    func updatePrediction(for image: CVPixelBuffer)
}

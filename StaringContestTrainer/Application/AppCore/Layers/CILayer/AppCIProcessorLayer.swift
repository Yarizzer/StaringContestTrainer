//
//  AppCIProcessorLayer.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

import CoreImage

class AppCIProcessorLayer {
    private var faceDetector: CIDetector?
}

extension AppCIProcessorLayer: AppCIProcessorLayerType {
    //MARK: - Session
    func prepareSession() {
        faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: Constants.accuracy)
    }

    
    func process(image: CIImage) {
        guard let detector = faceDetector else { return }
        
        let faces = detector.features(in: image, options: [CIDetectorEyeBlink: true])
        
        for face in faces {
            guard let faceAsFeature = face as? CIFaceFeature else { return }
            
            print("left eye is \(faceAsFeature.leftEyeClosed ? "closed" : "opened")")
        }
    }
}

extension AppCIProcessorLayer {
    private struct Constants {
        static let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
    }
}

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
    //MARK: - Func's
    func process(image: CIImage) -> Bool {
        guard let detector = faceDetector else { return true }
        
        let faces = detector.features(in: image, options: [CIDetectorEyeBlink: true])
        
        guard faces.indices.contains(Constants.firstFaceIndex), let firstFace = faces[Constants.firstFaceIndex] as? CIFaceFeature else { return true }
        
        return firstFace.leftEyeClosed || firstFace.rightEyeClosed
    }
}

extension AppCIProcessorLayer {
    private struct Constants {
        static let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh, CIDetectorTracking: true] as [String: Any]
        static let firstFaceIndex = 0
    }
}

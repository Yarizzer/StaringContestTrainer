//
//  AppCIProcessorLayer.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

import CoreImage

class AppCIProcessorLayer {
    //MARK: - Publishers
    var state: Publisher<CIProcessSessionState?> = Publisher(nil)
    
    private var faceDetector: CIDetector?
    private var finalImage: CIImage?
}

extension AppCIProcessorLayer: AppCIProcessorLayerType {
    //MARK: - Session
    func prepareSession() {
        faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: Constants.accuracy)
    }
    func closeSession() {
        state.value = .finished
    }
    
    func start() {
        state.value = .started
    }

    func getFinalImageData() -> CIImage? { finalImage }
    
    func process(image: CIImage) {
        guard let detector = faceDetector else { return }
        
        let faces = detector.features(in: image, options: [CIDetectorEyeBlink: true])
        
        for face in faces {
            guard let faceAsFeature = face as? CIFaceFeature else { return }
            
            var needToFinish = faceAsFeature.leftEyeClosed || faceAsFeature.rightEyeClosed
            
            if needToFinish {
                finalImage = image
                state.value = .finished
            }
        }
    }
}

extension AppCIProcessorLayer {
    private struct Constants {
        static let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh, CIDetectorTracking: true] as [String: Any]
    }
}

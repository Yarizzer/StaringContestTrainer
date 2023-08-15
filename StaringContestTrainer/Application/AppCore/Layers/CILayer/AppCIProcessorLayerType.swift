//
//  AppCIProcessorLayerType.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

import CoreImage

protocol AppCIProcessorLayerType {
    //MARK: - Session
    func prepareSession()
    func closeSession()
    //MARK: - Publishers
    var state: Publisher<CIProcessSessionState?> { get }
    
    func start()
    
    func getFinalImageData() -> CIImage?
    func process(image ciImage: CIImage)
}

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
    
    func process(image ciImage: CIImage)
}

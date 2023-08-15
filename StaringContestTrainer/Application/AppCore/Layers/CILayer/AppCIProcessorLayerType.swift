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
    //MARK: - Func's
    func process(image ciImage: CIImage) -> Bool
}

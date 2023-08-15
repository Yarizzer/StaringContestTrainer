//
//  CaptureViewModelType.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 10.08.2023.
//

import CoreImage

protocol CaptureViewModelType {
    //MARK: - Subscription
    func subscribe()
    
    //MARK: - func's
    func start()
    func check(image: CIImage)
}

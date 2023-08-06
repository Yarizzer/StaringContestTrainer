//
//  TrainingModel.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

import Foundation

struct TrainingModel {
    init(with data: Training) {
        self.created = data.created
        self.finished = data.finished
        self.finalImage = data.finalImage
    }
    
    private var created: Date
    private var finished: Date
    private var finalImage: Data
}

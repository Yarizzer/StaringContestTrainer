//
//  TrainingListTableViewCellViewModel.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 8.08.2023.
//

import Foundation

protocol TrainingListTableViewCellViewModelType {
    var created: String { get }
    var duration: String { get }
    var imageData: Data { get }
}

class TrainingListTableViewCellViewModel {
    init(with data: TrainingModel) {
        self.data = data
    }
    
    private let data: TrainingModel
    
    private lazy var dateFormatter: DateFormatter = {
        let timeZoneID = TimeZone.current.identifier
        
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.dateFormat
        formatter.timeZone = TimeZone(identifier: timeZoneID)
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        
        return formatter
    }()
}

extension TrainingListTableViewCellViewModel: TrainingListTableViewCellViewModelType {
    var created: String { dateFormatter.string(from: data.created) }
    #warning("finish with training duration")
    var duration: String { dateFormatter.string(from: data.created) }
    var imageData: Data { data.finalImage }
}

extension TrainingListTableViewCellViewModel {
    private struct Constants {
        static let dateFormat = "dd-MM-yyyy HH:mm:ss"
    }
}

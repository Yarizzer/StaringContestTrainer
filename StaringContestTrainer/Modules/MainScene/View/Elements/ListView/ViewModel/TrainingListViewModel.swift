//
//  TrainingListViewModel.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 8.08.2023.
//

protocol TrainingListViewModelType {
    //MARK: - Publishers
    var needToShowListButton: Publisher<Bool?> { get }
    
    func getCellViewModel(for index: Int) -> TrainingListTableViewCellViewModelType?
}

class TrainingListViewModel {
    init() {
        self.trainingData = AppCore.shared.coreDataLayer.trainingList.value
    }
    
    private var trainingData: [TrainingModel]? {
        didSet {
            guard let trainingData else {
                needToShowListButton.value = false
                return
            }
            
            needToShowListButton.value = !trainingData.isEmpty
        }
    }
    
    //MARK: - Publishers
    var needToShowListButton: Publisher<Bool?> = Publisher(nil)
}

extension TrainingListViewModel: TrainingListViewModelType {
    func getCellViewModel(for index: Int) -> TrainingListTableViewCellViewModelType? {
        guard let trainingData, trainingData.indices.contains(index) else { return nil }
        
        return TrainingListTableViewCellViewModel(with: trainingData[index])
    }
}

extension TrainingListViewModel: TableViewProviderViewModel {
    var numberOfTableSections: Int { Constants.sectionsCount }
    
    func numberOfTableRowsInSection(_ section: Int) -> Int { trainingData?.count ?? 0 }
    func heightForRow(atIndex index: Int) -> Float { Constants.rowHeightValue}
}

extension TrainingListViewModel {
    private struct Constants {
        static let sectionsCount = 1
        static let rowHeightValue: Float = 80.0
    }
}

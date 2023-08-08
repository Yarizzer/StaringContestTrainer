//
//  TrainingListView.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 8.08.2023.
//

import UIKit

class TrainingListView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    private func setupView() {
        
    }
    
    func setup(with model: TrainingListViewModel) {
        self.viewModel = model
        
        setupProvider()
    }
    
    private func setupProvider() {
        
    }
    
    private var viewModel: TrainingListViewModelType?
    
    private var provider: TableViewProviderType?
    private var tableView: UITableView?
}

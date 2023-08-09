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
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        guard let canvas else { return }

        canvas.layer.cornerRadius = Constants.canvasCornerRadiusValue
        canvas.layer.masksToBounds = true
    }
    
    private func setupView() {
        canvas = UIView()
        tableView = UITableView()
        
        guard let canvas, let tableView else { return }
        
        #warning("setting up table view here and other views")
        
        canvas.addSubview(tableView)
        
        addSubview(canvas)
    }
    
    private func setupConstraints() {
        guard let canvas, let tableView else { return }
        
        canvas.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        canvas.topAnchor.constraint(equalTo: topAnchor).isActive = true
        canvas.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        canvas.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        canvas.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: canvas.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: canvas.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: canvas.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: canvas.bottomAnchor).isActive = true
    }
    
    func setup(with model: TrainingListViewModelType) {
        self.viewModel = model
        
        setupProvider()
    }
    
    private func setupProvider() {
        guard let model = viewModel, let tableView else { return }
        
        provider = TableViewProvider(for: tableView, with: model as! TableViewProviderViewModel)
        provider?.registerCells([TrainingListTableViewCell.self])
        
        provider?.onConfigureCell = { [weak self] indexPath in
            guard let provider = self?.provider else { return UITableViewCell() }
            
            let cell: TrainingListTableViewCell = provider.dequeueReusableCell(for: indexPath)

            guard let cellModel = model.getCellViewModel(for: indexPath.row) else { return cell }

            cell.setup(with: cellModel)

            return cell
        }

        provider?.onSelectCell = { [weak self] indexPath in
            #warning("replace with model notification")
        }
    }
    
    private var viewModel: TrainingListViewModelType?
    
    private var provider: TableViewProviderType?
    
    private var canvas: UIView?
    private var tableView: UITableView?
}

extension TrainingListView {
    private struct Constants {
        static let canvasCornerRadiusValue: CGFloat = 30.0
    }
}

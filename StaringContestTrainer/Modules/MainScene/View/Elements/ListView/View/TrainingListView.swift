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
        provider = TableViewProvider(for: self.tableView, with: model as! TableViewProviderViewModel)
        provider?.registerCells([ItemSelectionSceneRoleTableViewCell.self,
                                 ItemSelectionSceneObjectTableViewCell.self])
        
        provider?.onConfigureCell = { [weak self] indexPath in
            guard let provider = self?.provider else { return UITableViewCell() }

            switch model.currentType {
            case .roleSelection:
                let cell: ItemSelectionSceneRoleTableViewCell = provider.dequeueReusableCell(for: indexPath)

                guard let cellModel = model.getCellViewModel(with: indexPath.row) else { return cell }

                cell.setup(with: cellModel)

                return cell
            case .objectSelection:
                let cell: ItemSelectionSceneObjectTableViewCell = provider.dequeueReusableCell(for: indexPath)

                guard let cellModel = model.getCellViewModel(with: indexPath.row) else { return cell }

                cell.setup(with: cellModel)

                return cell
            default: return UITableViewCell()
            }
        }

        provider?.onSelectCell = { [weak self] indexPath in
            self?.interactor?.makeRequest(requestType: .itemSelected(withIndex: indexPath.row))
        }
    }
    
    private var viewModel: TrainingListViewModelType?
    
    private var provider: TableViewProviderType?
    private var tableView: UITableView?
}

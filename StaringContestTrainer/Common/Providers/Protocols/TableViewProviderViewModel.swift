//
//  TableViewProviderViewModel.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 8.08.2023.
//

protocol TableViewProviderViewModel {
    var numberOfTableSections: Int { get }
    func numberOfTableRowsInSection(_ section: Int) -> Int
    func heightForRow(atIndex index: Int) -> Float
}

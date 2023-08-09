//
//  TrainingListTableViewCell.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 8.08.2023.
//

import UIKit

class TrainingListTableViewCell: UITableViewCell {
    override func layoutSubviews() {
        super.layoutSubviews()

//        guard let canvas else { return }
//
//        canvas.layer.cornerRadius = Constants.canvasCornerRadiusValue
//        canvas.layer.masksToBounds = true
    }
    
    func setup(with model: TrainingListTableViewCellViewModelType) {
        self.createdTitle.text = model.created
        
        setupView()
    }
    
    private func setupView() {
        canvas.backgroundColor = AppCore.shared.uiLayer.style.colorLightGray
        
//        cellTitle.textColor = AppCore.shared.uiLayer.style.colorDarkGray
//        cellTitle.adjustsFontSizeToFitWidth = true
//        cellTitle.minimumScaleFactor = Constants.minScaleFactor
    }
    
    @IBOutlet private weak var canvas: UIView!
    @IBOutlet private weak var durationTitle: UILabel!
    @IBOutlet private weak var createdTitle: UILabel!
    @IBOutlet private weak var finalImageView: UIImageView!
}

extension TrainingListTableViewCell: NibLoadableView { }

//
//  BaseViewController.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

import UIKit

class BaseViewController<InteractorT>: UIViewController {
    override func viewDidLoad() { super.viewDidLoad() }
    
    var interactor: InteractorT?
}

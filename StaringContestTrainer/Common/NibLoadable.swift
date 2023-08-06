//
//  NibLoadable.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

import UIKit

protocol NibLoadableView: AnyObject {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String { String(describing: self) }
}

extension NibLoadableView where Self: UIViewController {
    static var nibName: String { String(describing: self) }
}

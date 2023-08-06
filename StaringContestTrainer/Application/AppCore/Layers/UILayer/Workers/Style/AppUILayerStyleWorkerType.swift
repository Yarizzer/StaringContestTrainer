//
//  AppUILayerStyleWorkerType.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

import UIKit

protocol AppUILayerStyleWorkerType {
    //Colors
    var colorClear: UIColor { get }
    var colorWhite: UIColor { get }
    var colorBlack: UIColor { get }
    var colorLightGray: UIColor { get }
    var colorGray: UIColor { get }
    var colorDarkGray: UIColor { get }
    var colorRed: UIColor { get }
    var colorGreen: UIColor { get }
    var colorOrange: UIColor { get }

    //Fonts
    var labelTitleFontExtraLarge: UIFont { get }
    var labelTitleFontLarge: UIFont { get }
    var labelTitleFontMedium: UIFont { get }
    var labelTitleFontSmall: UIFont { get }
    //Layers
    var layerBorderWidth: CGFloat { get }
    var layerLineWidth: CGFloat { get }
    //ImageNames
    var logoImageName: String { get }
}

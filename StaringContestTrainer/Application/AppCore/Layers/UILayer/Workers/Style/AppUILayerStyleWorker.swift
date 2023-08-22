//
//  AppUILayerStyleWorker.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

import UIKit

class AppUILayerStyleWorker {
    //MARK: - Style
    private enum StyleColors {
        case clear
        case white
        case black
        case lightGray
        case gray
        case darkGray
        case red
        case green
        case orange
        
        var color: UIColor {
            switch self {
            case .clear:        return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
            case .white:        return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            case .black:        return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            case .lightGray:    return #colorLiteral(red: 0.9372547865, green: 0.9372549653, blue: 0.9415605664, alpha: 1)        // hex: EFEFF0
            case .gray:         return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)        // hex: 808080
            case .darkGray:     return #colorLiteral(red: 0.2352941176, green: 0.2352941176, blue: 0.2352941176, alpha: 1)        // hex: 3C3C3C
            case .red:          return #colorLiteral(red: 1, green: 0.3137254902, blue: 0, alpha: 1)        // hex: FF5000
            case .green:        return #colorLiteral(red: 0, green: 0.6666666667, blue: 0.3137254902, alpha: 1)        // hex: 00AA50
            case .orange:       return #colorLiteral(red: 0.9725490196, green: 0.5921568627, blue: 0, alpha: 1)        // hex: F89700
            }
        }
    }
    
//    private let metrics: UIFontMetrics
}

extension AppUILayerStyleWorker: AppUILayerStyleWorkerType {
    //Colors
    var colorClear: UIColor { StyleColors.clear.color }
    var colorWhite: UIColor { StyleColors.white.color }
    var colorBlack: UIColor { StyleColors.black.color }
    var colorLightGray: UIColor { StyleColors.lightGray.color }
    var colorGray: UIColor { StyleColors.gray.color }
    var colorDarkGray: UIColor { StyleColors.darkGray.color }
    var colorRed: UIColor { StyleColors.red.color }
    var colorGreen: UIColor { StyleColors.green.color }
    var colorOrange: UIColor { StyleColors.orange.color }
    
    //Fonts
    var labelTitleFontExtraLarge: UIFont { Constants.extraLargeFont }
    var labelTitleFontLarge: UIFont { Constants.largeFont }
    var labelTitleFontMedium: UIFont { Constants.mediumFont }
    var labelTitleFontSmall: UIFont { Constants.smallFont }
    func font(with style: UIFont.TextStyle) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: style)
        
        return metrics.scaledFont(for: Constants.mediumFont)
    }
    //Layers
    var layerBorderWidth: CGFloat { Constants.layerData.borderWidth }
    var layerLineWidth: CGFloat { Constants.layerData.lineWidth }
    //ImageNames
    var logoImageName: String { Constants.logoImageName }
}

extension AppUILayerStyleWorker {
    private struct Constants {
        static let extraLargeFont: UIFont = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 30) ?? UIFont.systemFont(ofSize: 30)
        static let largeFont: UIFont = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 20) ?? UIFont.systemFont(ofSize: 20)
        static let mediumFont: UIFont = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 15) ?? UIFont.systemFont(ofSize: 15)
        static let smallFont: UIFont = UIFont(name: "AppleSDGothicNeo-UltraLight", size: 12) ?? UIFont.systemFont(ofSize: 12)
        static let layerData: (borderWidth: CGFloat, lineWidth: CGFloat) = (borderWidth: 1.0, lineWidth: 1.2)
        static let logoImageName = "MainLogo"
    }
}

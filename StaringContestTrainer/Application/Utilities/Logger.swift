//
//  Logger.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

import Foundation

enum LogType {
    case info, debug, warning, error, coreDataError
    
    var key: String {
        switch self {
        case .info:             return Constants.infoValue
        case .debug:            return Constants.debugValue
        case .warning:          return Constants.warningValue
        case .error:            return Constants.errorValue
        case .coreDataError:    return Constants.coreDataValue
        }
    }
    
    private struct Constants {
        static let infoValue = "Info"
        static let debugValue = "Debug"
        static let warningValue = "Warning"
        static let errorValue = "Error"
        static let coreDataValue = "CoreData Error"
    }
}

func writeLog(type: LogType, message: String, functionName:  String = #function, fileNameWithPath: String = #file, lineNumber: Int = #line ) {
    let fileNameWithoutPath = (fileNameWithPath as NSString).lastPathComponent
    
    NSLog("\(type.key): [\(functionName) in file \(fileNameWithoutPath) line: \(lineNumber)] \(message)")
}

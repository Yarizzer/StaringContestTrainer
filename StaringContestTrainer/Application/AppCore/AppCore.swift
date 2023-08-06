//
//  AppCore.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

class AppCore {
    static let shared = AppCore()
    
    private init() {
        self.appUIL = AppUILayer()
        self.appCIL = AppCIProcessorLayer()
    }
    
    private let appUIL: AppUILayerType
    private let appCIL: AppCIProcessorLayerType
}

extension AppCore: AppCoreSessionType {
    func prepareSession(completion: @escaping (Bool) -> ()) {
        writeLog(type: .info, message: "Session prepared")
        completion(true)
    }
    func openSession() { writeLog(type: .info, message: "Session opened") }
    func closeSession() { writeLog(type: .info, message: "Session closed") }
}

extension AppCore: AppCoreUILayerType {
    var uiLayer: AppUILayerType { appUIL }
}

extension AppCore: AppCoreCIProcessorLayerType {
    var ciProcessorLayer: AppCIProcessorLayerType { appCIL }
}

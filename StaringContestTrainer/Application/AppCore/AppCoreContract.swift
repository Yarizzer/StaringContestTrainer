//
//  AppCoreContract.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

protocol AppCoreSessionType {
    func prepareSession(completion: @escaping (Bool) -> ())
    func openSession()
    func closeSession()
}

protocol AppCoreUILayerType {
    var uiLayer: AppUILayerType { get }
}

protocol AppCoreCIProcessorLayerType {
    var ciProcessorLayer: AppCIProcessorLayerType { get }
}

protocol AppCoreCoreDataLayerType {
    var coreDataLayer: AppCoreDataLayerType { get }
}

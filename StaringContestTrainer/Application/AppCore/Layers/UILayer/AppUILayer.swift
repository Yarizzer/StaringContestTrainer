//
//  AppUILayer.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

class AppUILayer {
    init() {
        self.styleWorker = AppUILayerStyleWorker()
        self.deviceWorker = AppUILayerDeviceWorker()
    }
    
    private let styleWorker: AppUILayerStyleWorkerType
    private let deviceWorker: AppUILayerDeviceWorkerType
}

extension AppUILayer: AppUILayerType {
    var style: AppUILayerStyleWorkerType { styleWorker }
    var device: AppUILayerDeviceWorkerType { deviceWorker }
}

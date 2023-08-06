//
//  InitialScenePresenterContract.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol InitialScenePresentable {
    func response(responseType: InitialScenePresenterResponse.InitialSceneResponseType)
}

struct InitialScenePresenterResponse {
	enum InitialSceneResponseType {
		case initialSetup
		case drainView
	}
}

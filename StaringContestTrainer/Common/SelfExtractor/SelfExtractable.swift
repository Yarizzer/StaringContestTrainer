//
//  SelfExtractable.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

import Foundation

protocol SelfExtractable: NSObject { }

extension SelfExtractable {
    typealias BasicCall = (Self) -> ()
    typealias BasicResponse = () -> ()
    typealias DataCall<T> = (Self, T) -> ()
    typealias DataResponse<T> = (T) -> ()
    
    func extractSelf(code: @escaping BasicCall) -> BasicResponse {
        return { [weak self] in
            guard let sSelf = self else { return }

            code(sSelf)
        }
    }
    
    func extractSelf<T>(_ code: @escaping DataCall<T>) -> DataResponse<T> {
        return { [weak self] data in
            guard let sSelf = self else { return }
            
            code(sSelf, data)
        }
    }
}

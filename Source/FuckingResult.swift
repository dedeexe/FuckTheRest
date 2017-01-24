//
//  FuckingResult.swift
//  FuckTheRest
//
//  Created by Fabrício Santos on 1/24/17.
//  Copyright © 2017 dede.exe. All rights reserved.
//

import Foundation

public enum FuckingResult<T> {
    case success(Int, T)
    case error(Error)
}

public extension FuckingResult {
    public func map<U>(_ fnc:(T) -> U) -> FuckingResult<U>
    {
        switch self {
            case .success(let statusCode, let resultValue):
                let mappedResult = fnc(resultValue)
                return FuckingResult<U>.success(statusCode, mappedResult)
            case .error(let error):
                return FuckingResult<U>.error(error)
        }
    }
}

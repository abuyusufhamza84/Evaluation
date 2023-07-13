//
//  AppError.swift
//  BCGCodingTest
//
//  Created by Mohammed Sadiq on 13/07/23.
//

import Foundation

/// Custom Error enum to use for Network Erros
enum AppError: Error, Equatable {
    case NetworkError(Error)
    case responseError(String, Int?)
    case encodingError(Error)
    case decodingError(Error)
    case anyError(Error)
    case NetworkUnavailable


    static func == (lhs: AppError, rhs: AppError) -> Bool {
        return lhs.description == rhs.description
    }
}

extension AppError {
    // Description of the Error
    public var description: String {
        switch self {
        case .responseError(let reason, _):
            return reason
        case .encodingError(let error):
            return error.localizedDescription
        case .decodingError(let error):
            return error.localizedDescription
        case .anyError(let error):
            return error.localizedDescription
        case .NetworkError(let error):
            return error.localizedDescription
        case .NetworkUnavailable:
            return "Network Rechability Failure"
        }
    }
}


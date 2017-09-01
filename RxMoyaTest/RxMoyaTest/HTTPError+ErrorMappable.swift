//
//  HTTPError+ErrorMappable.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/30/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation

extension HTTPError: IndentifiableError {
    var code: Int {
        switch self {
        case .timedOut:
            return -1001
        case .unreachable:
            return -1009
        case .notFound:
            return 404
        case .badRequest:
            return 400
        case .internalServerError:
            return 500
        }
    }
}

extension HTTPError: ErrorMappable {
    var errorMap: ErrorMap {
        return [
            HTTPError.timedOut.code: (type: .common, presentation: .alert, message: HTTPError.timedOut.localizedDescription),
            HTTPError.unreachable.code: (type: .common, presentation: .alert, message: HTTPError.unreachable.localizedDescription),
            HTTPError.notFound.code: (type: .common, presentation: .alert, message: HTTPError.notFound.localizedDescription),
            HTTPError.internalServerError.code: (type: .common, presentation: .alert, message: HTTPError.notFound.localizedDescription),
            HTTPError.badRequest.code: (type: .common, presentation: .alert, message: HTTPError.badRequest.localizedDescription)
        ]
    }
    
    var localizedDescription: String {
        switch self {
        case .timedOut:
            return "Request timed out"
        case .unreachable:
            return "No internet connection"
        case .notFound:
            return "Host not found"
        case .badRequest:
            return "Bad request"
        case .internalServerError:
            return "Internal server error"
        }
    }
}

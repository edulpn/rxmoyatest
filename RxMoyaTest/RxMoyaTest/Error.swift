//
//  Error.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/28/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation

protocol CodeIndentifiable {
    var code: Int { get }
}

typealias IndentifiableError = (Error & CodeIndentifiable)

typealias ErrorMap = [Int: (type: ErrorType, presentation: Presentation, message: String?)]

protocol ErrorMappable {
    var errorMap: ErrorMap { get }
}

enum CommonError: IndentifiableError {
    case generic
    case unknown
    
    var code: Int {
        switch self {
        case .generic:
            return 0
        case .unknown:
            return 1
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .generic:
            return "Generic error"
        case .unknown:
            return "Unknown error"
        }
    }
}

struct UserError: Error {
    let code: Int
    let type: ErrorType
    var presentation: Presentation
    let message: String
    
    init(with code: Int = CommonError.generic.code, type: ErrorType = .common, presentation: Presentation = .alert, message: String = CommonError.generic.localizedDescription) {
        self.code = code
        self.type = type
        self.presentation = presentation
        self.message = message
    }
    
    init(for code: Int, with errorMap: ErrorMap) {
        if let (type, presentation, message) = errorMap[code] {
            self.init(with: code, type: type, presentation: presentation, message: message ?? "")
        } else {
            self.init()
        }
    }
    
    static func generic() -> UserError {
        return UserError()
    }
}

public enum ErrorType {
    case terminate
    case common
}

public enum Presentation {
    case alert
    case toast
}

extension Error where Self: IndentifiableError {
    func userError(with errorMap: ErrorMap? = nil) -> UserError {
        if let userError = self as? UserError {
            return userError
        }
        
        if let errorMap = errorMap {
            return UserError(for: self.code, with: errorMap)
        }
        
        return UserError.generic()
    }
}

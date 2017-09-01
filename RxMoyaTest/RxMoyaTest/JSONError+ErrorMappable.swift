//
//  JSONError+ErrorMappable.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/30/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation

extension JSONError: IndentifiableError {
    var code: Int {
        switch self {
        case .invalidJSON:
            return 0
        case .canNotMapToEntity:
            return 1
        }
    }
}

extension JSONError: ErrorMappable {
    var errorMap: ErrorMap {
        return [JSONError.invalidJSON.code: (type: .common, presentation: .alert, message: JSONError.invalidJSON.localizedDescription),
                JSONError.canNotMapToEntity.code: (type: .common, presentation: .alert, message: JSONError.canNotMapToEntity.localizedDescription)
        ]
    }
    
    var localizedDescription: String {
        switch self {
        case .invalidJSON:
            return "Response is not a JSON object/array"
        case .canNotMapToEntity:
            return "Response JSON could not be mapped to entity object"
        }
    }
}

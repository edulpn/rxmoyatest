//
//  RepositoryMappingError.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/30/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation

enum RepositoryMappingError: IndentifiableError {
    case invalidURL
    case invalidCreationDate
    
    var code: Int {
        switch self {
        case .invalidURL:
            return 0
        case .invalidCreationDate:
            return 1
        }
    }
}

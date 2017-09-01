//
//  HTTPError.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/29/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation

enum HTTPError {
    case timedOut
    case unreachable
    case notFound
    case badRequest
    case internalServerError
}

//
//  GithubEndpoint.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/25/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation
import Moya

enum Github {
    case repos(ownedBy: String)
}

extension Github: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .repos(let query):
            return "/users/\(query.URLEscaped)/repos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .repos:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .repos:
            return nil
        }
    }
    
    var sampleData: Data {
        switch self {
        case .repos(let query):
            return "{{\"id\": \"1\", \"language\": \"Swift\", \"url\": \"https://api.github.com/repos/edulpn/\(query)\", \"name\": \"\(query)\"}}}".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .repos:
            return .request
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .repos:
            return JSONEncoding.default
        }
    }
}

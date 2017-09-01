//
//  RepositoryNetworkDataSource.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/25/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation
import Moya
import RxMoya
import RxSwift

struct RepositoryNetworkDataSource: RepositoryDataSource {
    private let provider = RxMoyaProvider<Github>()
    
    func getRepositories(ownedBy userName: String) -> Observable<[RepositoryEntity]> {
        return provider.request(Github.repos(ownedBy: userName))
            .debug()
            .filterSuccessfulStatusCodes()
            .mapHTTPError()
            .mapRepositoryEntityArray()
    }
}

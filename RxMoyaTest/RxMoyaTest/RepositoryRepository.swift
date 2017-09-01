//
//  RepositoryRepository.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/25/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation
import RxSwift

//Ironic, right?
struct RepositoryRepository: RepositoryController {
    private let api: RepositoryDataSource
    
    init(with api: RepositoryDataSource) {
        self.api = api
    }
    
    func getRepositories(ownedBy name: String) -> Observable<[Repository]> {
        return api.getRepositories(ownedBy: name).mapRepositoryArray()
    }
}

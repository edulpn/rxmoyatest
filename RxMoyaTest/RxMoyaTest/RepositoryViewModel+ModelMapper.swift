//
//  RepositoryViewModel+ModelMapper.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/31/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation

extension RepositoryViewModel {
    init(from repository: Repository) {
        fullName = repository.fullName
        ownerLogin = repository.owner.login
        URL = repository.URL
    }
}

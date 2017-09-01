//
//  ObservableType+RepositoryEntityMapper.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/25/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper

extension Repository {
    init(from entity: RepositoryEntity) {
        id = entity.id
        fullName = entity.fullName
        name = entity.name
        owner = User(with: entity.owner)
        URL = entity.URL
        createdAt = entity.createdAt
    }
}

extension User {
    init(with entity: UserEntity) {
        login = entity.login
    }
}

extension ObservableType where E == [RepositoryEntity] {
    func mapRepositoryArray() -> Observable<[Repository]> {
        return flatMap { entities -> Observable<[Repository]> in
            let models = entities.map {
                Repository(from: $0)
            }
            return Observable.just(models)
        }
    }
}

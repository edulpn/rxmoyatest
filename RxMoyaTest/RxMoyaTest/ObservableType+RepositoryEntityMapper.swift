//
//  ObservableType+RepositoryEntityMapper.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/31/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

extension ObservableType where E == Response {
    func mapRepositoryEntityArray() -> Observable<[RepositoryEntity]> {
        return flatMap { response -> Observable<[RepositoryEntity]> in
            guard let responseJSON = try? response.mapJSON() else {
                return Observable.error(JSONError.invalidJSON)
            }
            guard let entities = try? Mapper<RepositoryEntity>().mapArray(JSONObject: responseJSON) else {
                return Observable.error(JSONError.canNotMapToEntity)
            }
            return Observable.just(entities)
        }
    }
}

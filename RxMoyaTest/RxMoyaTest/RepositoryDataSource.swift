//
//  RepositoryDataSource.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/30/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation
import RxSwift

protocol RepositoryDataSource {
    func getRepositories(ownedBy userName: String) -> Observable<[RepositoryEntity]>
}

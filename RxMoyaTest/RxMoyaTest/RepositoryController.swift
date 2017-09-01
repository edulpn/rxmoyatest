//
//  RepositoryController.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/31/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation
import RxSwift

protocol RepositoryController {
    func getRepositories(ownedBy name: String) -> Observable<[Repository]>
}

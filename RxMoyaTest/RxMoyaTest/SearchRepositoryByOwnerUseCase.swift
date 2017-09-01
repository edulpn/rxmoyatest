//
//  SearchRepositoryByOwnerUseCase.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/25/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation
import RxSwift

struct SearchRepositoryByOwnerUseCase {
    private let controller: RepositoryController
    
    init(with controller: RepositoryController) {
        self.controller = controller
    }
    
    func retrieveRepositories(ownedBy userName: String) -> Observable<[Repository]> {
        if userName.trimmingCharacters(in: CharacterSet.whitespaces) == "" {
            return Observable.error(GithubError.emptyRepositoryOwnerName)
        } else {
            return controller.getRepositories(ownedBy: userName)
        }
    }
}

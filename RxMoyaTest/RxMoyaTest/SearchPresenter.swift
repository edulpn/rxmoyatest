//
//  SearchPresenter.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/25/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation
import RxSwift

protocol SearchPresenterType: class {
    weak var view: SearchViewType! {get set}
    var useCase: SearchRepositoryByOwnerUseCase {get set}
    
    func retrieveRepositories(ownedBy userName: String)
}

class SearchPresenter: SearchPresenterType {
    weak var view: SearchViewType!
    var useCase: SearchRepositoryByOwnerUseCase
    let disposeBag = DisposeBag()
    
    var repositories: [Repository]
    
    init(with useCase: SearchRepositoryByOwnerUseCase) {
        self.useCase = useCase
        repositories = []
    }
    
    func retrieveRepositories(ownedBy userName: String) {
        view.displayLoadingView()
        useCase.retrieveRepositories(ownedBy: userName).subscribe(onNext: { repositories in
            self.view.hideLoadingView()
            self.repositories = repositories
            let viewModels = repositories.map { repository -> RepositoryViewModel in
                return RepositoryViewModel(from: repository)
            }
            self.view.display(viewModels)
            
        }, onError: { error in
            self.view.hideLoadingView()
            if let mappableError = error as? (ErrorMappable & IndentifiableError) {
                let userError = UserError(for: mappableError.code, with: mappableError.errorMap)
                self.view.display(userError)
            } else if let githubError = error as? GithubError {
                switch githubError {
                case .emptyRepositoryOwnerName:
                    self.view.displayEmptyState()
                }
            } else {
                self.view.display(UserError.generic())
            }
        }).addDisposableTo(disposeBag)
    }
}

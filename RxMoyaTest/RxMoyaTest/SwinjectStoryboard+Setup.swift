//
//  SwinjectStoryboard+Setup.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/25/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    public static func setup() {
        defaultContainer.register(RepositoryDataSource.self) { resolver -> RepositoryDataSource in
            RepositoryNetworkDataSource()
        }
        
        defaultContainer.register(RepositoryController.self) { resolver -> RepositoryController in
            RepositoryRepository(with: resolver.resolve(RepositoryDataSource.self)!)
        }
        
        defaultContainer.register(SearchRepositoryByOwnerUseCase.self) { resolver -> SearchRepositoryByOwnerUseCase in
            SearchRepositoryByOwnerUseCase(with: resolver.resolve(RepositoryController.self)!)
        }
        
        defaultContainer.register(SearchPresenter.self) { resolver -> SearchPresenter in
            SearchPresenter(with: resolver.resolve(SearchRepositoryByOwnerUseCase.self)!)
        }
        
        defaultContainer.storyboardInitCompleted(SearchViewController.self) { (resolver, viewController) in
            let presenter = resolver.resolve(SearchPresenter.self)!
            presenter.view = viewController
            viewController.presenter = presenter
        }
    }
}

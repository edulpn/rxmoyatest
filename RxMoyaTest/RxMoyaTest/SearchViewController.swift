//
//  SearchViewController.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/25/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

protocol SearchViewType: class, UserErrorDisplayer {
    func displayLoadingView()
    func hideLoadingView()
    
    func display(_ results: [RepositoryViewModel])
    func displayEmptyState()
    
    var presenter: SearchPresenterType! {get set}
    var results: [RepositoryViewModel] {get set}
}

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var resultsTableView: UITableView!
    var presenter: SearchPresenterType!
    var results: [RepositoryViewModel] = []
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.rowHeight = UITableViewAutomaticDimension
        
        setupSearchBar()
    }
    
    func setupSearchBar() {
        searchBar
            .rx
            .text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance).distinctUntilChanged()
            .subscribe(onNext: { userName in
                self.presenter.retrieveRepositories(ownedBy: userName)
            }).addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SearchViewController: SearchViewType {
    func displayLoadingView() {
        loadingView.isHidden = false
    }
    
    func hideLoadingView() {
        loadingView.isHidden = true
    }
    
    func display(_ results: [RepositoryViewModel]) {
        self.results = results
        resultsTableView.reloadData()
    }
    
    func displayEmptyState() {
        self.results = []
        resultsTableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryCellIdentifier", for: indexPath) as? RepositoryTableViewCell {
            let viewModel = results[indexPath.row]
            cell.configure(with: viewModel.fullName, and: viewModel.URL)
            return cell
        }
        return UITableViewCell()
    }
}

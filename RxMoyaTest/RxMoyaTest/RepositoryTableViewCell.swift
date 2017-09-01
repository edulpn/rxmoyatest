//
//  RepositoryTableViewCell.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/25/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryUrlLabel: UILabel!

    func configure(with repositoryName: String, and repositoryUrl: String) {
        repositoryNameLabel.text = repositoryName
        repositoryUrlLabel.text = repositoryUrl
    }
}

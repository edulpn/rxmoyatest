//
//  UserErrorDisplayer.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 9/1/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import UIKit

protocol UserErrorDisplayer {
    func display(_ userError: UserError)
}

extension UserErrorDisplayer where Self: UIViewController {
    func display(_ userError: UserError) {
        switch userError.presentation {
        case .alert:
            let alert = UIAlertController(title: "", message: userError.message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(alert, animated: true)
        case .toast:
            //The same way as above, here we configure a Toast message and display it
            break
        }
    }
}

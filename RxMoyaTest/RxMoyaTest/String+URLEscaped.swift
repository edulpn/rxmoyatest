//
//  String+URLEscaped.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/25/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation

extension String {
    var URLEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
    }
}

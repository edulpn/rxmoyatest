//
//  ObservableType+HTTPErrorMapper.swift
//  RxMoyaTest
//
//  Created by Eduardo Pinto on 8/28/17.
//  Copyright © 2017 Eduardo Pinto. All rights reserved.
//

import Foundation
import RxSwift

extension HTTPError {
    init(from urlError: URLError) throws {
        switch urlError.code.rawValue {
        case -1001:
            self = .timedOut
        case -1009:
            self = .unreachable
        case 404:
            self = .notFound
        case 400:
            self = .badRequest
        case 500:
            self = .internalServerError
        default:
            throw urlError
        }
    }
}

extension ObservableType {
    func mapHTTPError() -> Observable<E> {
        return catchError { error -> Observable<E> in
            guard let urlError = error as? URLError else {
                return Observable.error(error)
            }
            guard let httpError = try? HTTPError(from: urlError) else {
                return Observable.error(error)
            }
            return Observable.error(httpError)
        }
    }
}

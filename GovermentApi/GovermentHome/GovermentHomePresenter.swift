//
//  GovermentHomePresenter.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation

class GovermentHomePresenter {
    weak var view: GovermentHomeViewProtocol?
    var router: GovermentHomeRouterProtocol?
}

extension GovermentHomePresenter: GovermentHomePresenterProtocol {
    func requestElementDetails(element: Result) {
        router?.navigateToElementDetails(element: element)
    }
}

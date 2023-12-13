//
//  GovermentDetailsPresenter.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation

class GovermentDetailsPresenter {
    var interactor: GovermentDetailsInteractorProtocol?
    weak var view: GovermentDetailsViewProtocol?
    var router: GovermentDetailsRouterProtocol?
}



extension GovermentDetailsPresenter: GovermentDetailsPresenterProtocol {
    
}

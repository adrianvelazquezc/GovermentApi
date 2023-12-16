//
//  GovermentSplashPresenter.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation

class GovermentSplashPresenter {
    var interactor: GovermentSplashInteractorProtocol?
    var router: GovermentSplashRouterProtocol?
    weak var view: GovermentSplashViewProtocol?
    var tempResponseData: Response?
}

extension GovermentSplashPresenter: GovermentSplashPresenterProtocol {
    func requestInfo() {
        interactor?.fetchData()
    }
    
    func responseInfo(responseData: Response) {
        tempResponseData = responseData
    }
    
    func responseErrorInfo(error: String) {
        view?.notifyError(error: error)
    }
    
    func requestNextView() {
        if let noNilResponse = tempResponseData {
            router?.navigateToNextView(responseData: noNilResponse)
        }
    }
}

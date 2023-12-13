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
}



extension GovermentSplashPresenter: GovermentSplashPresenterProtocol {
    func requestInfo() {
        interactor?.fetchData()
    }
    
    func responseInfo(responseData: Response) {
        view?.dissmissLoading()
        router?.navigateToNextView(responseData: responseData)
    }
    
    func responseErrorInfo(error: String) {
        view?.dissmissLoading()
        view?.notifyError(error: error)
    }
}

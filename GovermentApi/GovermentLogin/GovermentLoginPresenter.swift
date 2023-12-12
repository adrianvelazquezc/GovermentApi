//
//  GovermentLoginPresenter.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation

class GovermentLoginPresenter {
    var interactor: GovermentLoginInteractorProtocol?
    weak var view: GovermentLoginViewProtocol?
    var router: GovermentLoginRouterProtocol?
    private var tempResponse: Response?
}



extension GovermentLoginPresenter: GovermentLoginPresenterProtocol {
    func requestNewUserLogin(userInfo: UserInfo) {
        view?.showLoading()
        interactor?.authenticateUserLogin(userInfo: userInfo)
    }
    func responseNewUserLogin() {
        view?.dissmissLoading()
        router?.navigateToNextView()
    }
    
    func requestUserLogin(userInfo: UserInfo) {
        view?.showLoading()
        interactor?.authenticateUserLogin(userInfo: userInfo)
    }
    func responseUserLogin() {
        view?.dissmissLoading()
        router?.navigateToNextView()
    }
    
    func requestCheckGoogleLogin() {
        view?.showLoading()
    }
    func responseCheckGoogleLogin() {
        view?.dissmissLoading()
    }
    
    func responseErrorInfo(error: String) {
        view?.dissmissLoading()
        view?.notifyError(error: error)
    }
}

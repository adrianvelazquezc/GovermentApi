//
//  GovermentLoginPresenter.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

class GovermentLoginPresenter {
    var interactor: GovermentLoginInteractorProtocol?
    weak var view: GovermentLoginViewProtocol?
    var router: GovermentLoginRouterProtocol?
    private var tempResponse: Response?
}



extension GovermentLoginPresenter: GovermentLoginPresenterProtocol {
    func requestNewUserLogin(userInfo: UserInfo) {
        view?.showLoading()
        interactor?.postNewUser(userInfo: userInfo)
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
    
    func requestCheckGoogleLogin(present: UIViewController) {
        view?.showLoading()
        interactor?.fetchLognInWithGoogle(present: present)
    }
    func responseCheckGoogleLogin() {
        view?.dissmissLoading()
        router?.navigateToNextView()
    }
    
    func responseErrorInfo(error: String) {
        view?.dissmissLoading()
        view?.notifyError(error: error)
    }
}

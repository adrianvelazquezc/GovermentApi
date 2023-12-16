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
    private var tempViewController = UIViewController()
}

extension GovermentLoginPresenter: GovermentLoginPresenterProtocol {
    func requestLoginWithBiometrics(present: UIViewController) {
        if let userMail = UserDefaults.standard.string(forKey: "userMail"),
           let userPassword = UserDefaults.standard.string(forKey: "userPassword") {
            let userInfo = UserInfo(userMail: userMail, userPassword: userPassword)
            interactor?.authenticateUserLogin(userInfo: userInfo)
        } else if let clientID = UserDefaults.standard.string(forKey: "clientID") {
            interactor?.fetchLognInWithGoogle(present: present, clientID: clientID)
        } else {
            view?.notifyError(error: "User information not found.")
        }
    }
    
    func isUserAlredyLoggedIn() -> Bool {
        return !UserDefaults.standard.bool(forKey: "userLoggedIn")
    }
    
    func requestNewUserLogin(userInfo: UserInfo) {
        view?.showLoading()
        interactor?.postNewUser(userInfo: userInfo)
    }
    
    func responseNewUserLogin(userInfo: UserInfo) {
        UserDefaults.standard.set(true, forKey: "userLoggedIn")
        UserDefaults.standard.set(userInfo.userMail, forKey: "userMail")
        UserDefaults.standard.set(userInfo.userPassword, forKey: "userPassword")
        view?.dissmissLoading()
        router?.navigateToNextView()
    }
    
    func requestUserLogin(userInfo: UserInfo) {
        view?.showLoading()
        interactor?.authenticateUserLogin(userInfo: userInfo)
    }
    func responseUserLogin(userInfo: UserInfo) {
        view?.dissmissLoading()
        router?.navigateToNextView()
    }
    
    func requestCheckGoogleLogin(present: UIViewController) {
        view?.showLoading()
        interactor?.fetchLognInWithGoogle(present: present, clientID: nil)
    }
    
    func responseCheckGoogleLogin(clientID: String) {
        UserDefaults.standard.set(clientID, forKey: "clientID")
        view?.dissmissLoading()
        router?.navigateToNextView()
    }
    
    func requestLoginWithFaceBiometrics(present: UIViewController) {
        tempViewController = present
        view?.showLoading()
        interactor?.authenticateFaceBiometricsLogin()
    }
    
    func responseLoginWithFaceBiometrics() {
        requestLoginWithBiometrics(present: tempViewController)
    }
    
    func responseErrorInfo(error: String) {
        view?.dissmissLoading()
        view?.notifyError(error: error)
    }
}

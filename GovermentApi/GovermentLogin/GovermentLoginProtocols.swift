//
//  GovermentLoginProtocols.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

protocol GovermentLoginViewProtocol: AnyObject {
    func notifyError(error: String)
    func showLoading()
    func dissmissLoading()
}

protocol GovermentLoginInteractorProtocol: AnyObject {
    func authenticateUserLogin(userInfo: UserInfo)
    func postNewUser(userInfo: UserInfo)
    func fetchLognInWithGoogle(present: UIViewController, clientID: String?)
    func authenticateFaceBiometricsLogin()
}

protocol GovermentLoginPresenterProtocol: AnyObject {
    //register
    func requestNewUserLogin(userInfo: UserInfo)
    func responseNewUserLogin(userInfo: UserInfo)
    
    //log in
    func requestUserLogin(userInfo: UserInfo)
    func responseUserLogin(userInfo: UserInfo)
    
    //access using google button
    func requestCheckGoogleLogin(present: UIViewController)
    func responseCheckGoogleLogin(clientID: String)
    
    //biometrics
    func requestLoginWithFaceBiometrics(present: UIViewController)
    func responseLoginWithFaceBiometrics()
    
    func requestLoginWithBiometrics(present: UIViewController)
    
    func responseErrorInfo(error: String)
    func isUserAlredyLoggedIn() -> Bool
    func requestGoToNextView()
}

protocol GovermentLoginRouterProtocol: AnyObject {
    func navigateToNextView()
}

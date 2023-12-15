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
    func fetchLognInWithGoogle(present: UIViewController)
}

protocol GovermentLoginPresenterProtocol: AnyObject {
    //register
    func requestNewUserLogin(userInfo: UserInfo)
    func responseNewUserLogin()
    
    //log in
    func requestUserLogin(userInfo: UserInfo)
    func responseUserLogin()
    
    //access using google button
    func requestCheckGoogleLogin(present: UIViewController)
    func responseCheckGoogleLogin()
    
    func responseErrorInfo(error: String)
}

protocol GovermentLoginRouterProtocol: AnyObject {
    func navigateToNextView()
}

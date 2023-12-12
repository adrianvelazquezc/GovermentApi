//
//  GovermentLoginProtocols.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation

protocol GovermentLoginViewProtocol: AnyObject {
    func notifyError(error: String)
    func showLoading()
    func dissmissLoading()
}

protocol GovermentLoginInteractorProtocol: AnyObject {
    func authenticateUserLogin(userInfo: UserInfo)
    func postNewUser(userInfo: UserInfo)
}

protocol GovermentLoginPresenterProtocol: AnyObject {
    //register
    func requestNewUserLogin(userInfo: UserInfo)
    func responseNewUserLogin()
    
    //log in
    func requestUserLogin(userInfo: UserInfo)
    func responseUserLogin()
    
    //access using google button
    func requestCheckGoogleLogin()
    func responseCheckGoogleLogin()
    
    func responseErrorInfo(error: String)
}

protocol GovermentLoginRouterProtocol: AnyObject {
    func navigateToNextView()
}

//
//  GovermentLoginInteractor.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation
import FirebaseAuth

class GovermentLoginInteractor {
    var presenter: GovermentLoginPresenterProtocol?
}

extension GovermentLoginInteractor: GovermentLoginInteractorProtocol {
    func postNewUser(userInfo: UserInfo) {
        Auth.auth().createUser(withEmail: userInfo.userMail, password: userInfo.userPassword) {
            (result, error) in
            DispatchQueue.main.async {
                if let _ = result, error == nil {
                    self.presenter?.responseNewUserLogin()
                } else {
                    self.presenter?.responseErrorInfo(error: error?.localizedDescription ?? "Looks like there were an error")
                }
            }
        }
    }
    
    func authenticateUserLogin(userInfo: UserInfo) {
        Auth.auth().signIn(withEmail: userInfo.userMail, password: userInfo.userPassword) {
            (result, error) in
            DispatchQueue.main.async {
                if let _ = result, error == nil {
                    self.presenter?.responseNewUserLogin()
                } else {
                    self.presenter?.responseErrorInfo(error: error?.localizedDescription ?? "Looks like there were an error")
                }
            }
        }
    }
}

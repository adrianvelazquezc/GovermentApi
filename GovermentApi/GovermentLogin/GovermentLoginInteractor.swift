//
//  GovermentLoginInteractor.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit
import GoogleSignIn

protocol AuthenticationManagerProtocol {
    func createUser(withEmail email: String, password: String, completion: @escaping (Bool, String?) -> Void)
    func signIn(withEmail email: String, password: String, completion: @escaping (Bool, String?) -> Void)
    func signInWithGoogle(clientID: String?, presenting viewController: UIViewController, completion: @escaping (Bool, String?) -> Void)
    func signInWithBiometrics(completion: @escaping (Bool, String?) -> Void)
}

class GovermentLoginInteractor {
    var presenter: GovermentLoginPresenterProtocol?
    var networkManager: AuthenticationManagerProtocol
    
    init(authenticationManager: AuthenticationManagerProtocol = Goverment_LoginNetworkManager()) {
        self.networkManager = authenticationManager
    }
}

extension GovermentLoginInteractor: GovermentLoginInteractorProtocol {
    func postNewUser(userInfo: UserInfo) {
        networkManager.createUser(withEmail: userInfo.userMail, password: userInfo.userPassword) { [weak self] success, error in
            DispatchQueue.main.async {
                if success {
                    self?.presenter?.responseNewUserLogin(userInfo: userInfo)
                } else {
                    self?.presenter?.responseErrorInfo(error: error ?? "Looks like there were an error")
                }
            }
        }
    }
    
    func authenticateUserLogin(userInfo: UserInfo) {
        networkManager.signIn(withEmail: userInfo.userMail, password: userInfo.userPassword) { [weak self] success, error in
            DispatchQueue.main.async {
                if success {
                    self?.presenter?.responseUserLogin(userInfo: userInfo)
                } else {
                    self?.presenter?.responseErrorInfo(error: error ?? "Looks like there were an error")
                }
            }
        }
    }
    
    func fetchLognInWithGoogle(present: UIViewController, clientID: String?) {
        networkManager.signInWithGoogle(clientID: clientID, presenting: present) { [weak self] success, error in
            DispatchQueue.main.async {
                if success {
                    self?.presenter?.responseCheckGoogleLogin(clientID: clientID ?? "")
                } else {
                    self?.presenter?.responseErrorInfo(error: error ?? "Looks like there were an error")
                }
            }
        }
    }
    
    func authenticateFaceBiometricsLogin() {
        networkManager.signInWithBiometrics { [weak self] success, error in
            DispatchQueue.main.async {
                if success {
                    self?.presenter?.responseLoginWithFaceBiometrics()
                } else {
                    self?.presenter?.responseErrorInfo(error: error ?? "Looks like there were an error")
                }
            }
        }
    }
}

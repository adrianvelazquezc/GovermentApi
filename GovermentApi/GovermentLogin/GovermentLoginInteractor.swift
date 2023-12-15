//
//  GovermentLoginInteractor.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import LocalAuthentication

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
    
    func fetchLognInWithGoogle(present: UIViewController) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: present) { user, error in
            guard error == nil else {
                self.presenter?.responseErrorInfo(error: error?.localizedDescription ?? "Looks like there were an error")
                return
            }
            
            guard let authentication = user?.authentication,
                  let idToken = authentication.idToken
            else {
                self.presenter?.responseErrorInfo(error: error?.localizedDescription ?? "Looks like there were an error")
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result, error in
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
    
    func authenticateFingerBiometricsLogin() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate to log in"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, authenticationError) in
                DispatchQueue.main.async {
                    if success {
                        self.presenter?.responseLoginWithFingerBiometrics()
                    } else {
                        if let error = authenticationError as? LAError {
                            switch error.code {
                            case .userCancel, .userFallback, .systemCancel:
                                self.presenter?.responseErrorInfo(error: error.localizedDescription)
                            default:
                                self.presenter?.responseErrorInfo(error: "Looks like there were an error")
                            }
                        }
                    }
                }
            }
        } else {
            presenter?.responseErrorInfo(error: "Biometric authentication is not available on this device.")
        }
    }
    
    func authenticateFaceBiometricsLogin() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate to access your account"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, authenticationError) in
                DispatchQueue.main.async {
                    if success {
                        self.presenter?.responseLoginWithFingerBiometrics()
                    } else {
                        if let error = authenticationError as? LAError {
                            switch error.code {
                            case .userCancel, .userFallback, .systemCancel:
                                self.presenter?.responseErrorInfo(error: error.localizedDescription)
                            default:
                                self.presenter?.responseErrorInfo(error: "Looks like there were an error")
                            }
                        }
                    }
                }
            }
        } else {
            presenter?.responseErrorInfo(error: "Biometric authentication is not available on this device.")
        }
    }
}

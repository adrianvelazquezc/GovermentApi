//
//  Goverment_LoginNetworkManager.swift
//  GovermentApi
//
//  Created by Mac on 18/12/23.
//

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn
import LocalAuthentication

class Goverment_LoginNetworkManager: AuthenticationManagerProtocol {
    func createUser(withEmail email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            DispatchQueue.main.async {
                if let _ = result, error == nil {
                    completion(true, nil)
                } else {
                    completion(false, error?.localizedDescription)
                }
            }
        }
    }
    
    func signIn(withEmail email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            DispatchQueue.main.async {
                if let _ = result, error == nil {
                    completion(true, nil)
                } else {
                    completion(false, error?.localizedDescription)
                }
            }
        }
    }
    
    func signInWithGoogle(clientID: String?, presenting viewController: UIViewController, completion: @escaping (Bool, String?) -> Void) {
        
            var config: GIDConfiguration
            
            if let noNilClientId = clientID {
                config = GIDConfiguration(clientID: noNilClientId)
            } else {
                guard let clientIDFromFirebase = FirebaseApp.app()?.options.clientID else {
                    completion(false, "ClientID not found.")
                    return
                }
                
                config = GIDConfiguration(clientID: clientIDFromFirebase)
            }
            
            GIDSignIn.sharedInstance.signIn(with: config, presenting: viewController) { user, error in
                guard error == nil else {
                    completion(false, error?.localizedDescription)
                    return
                }
                
                guard let authentication = user?.authentication,
                      let idToken = authentication.idToken
                else {
                    completion(false, error?.localizedDescription)
                    return
                }
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                               accessToken: authentication.accessToken)
                
                Auth.auth().signIn(with: credential) { result, error in
                    DispatchQueue.main.async {
                        if let _ = result, error == nil {
                            completion(true, nil)
                        } else {
                            completion(false, error?.localizedDescription)
                        }
                    }
                }
            }
    }
    
    func signInWithBiometrics(completion: @escaping (Bool, String?) -> Void) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate to access your account"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { (success, authenticationError) in
                DispatchQueue.main.async {
                    if success {
                        completion(true, nil)
                    } else {
                        if let error = authenticationError as? LAError {
                            switch error.code {
                            case .userCancel, .userFallback, .systemCancel:
                                completion(false, error.localizedDescription)
                            default:
                                completion(false, "Looks like there were an error")
                            }
                        }
                    }
                }
            }
        } else {
            completion(false, "Biometric authentication is not available on this device.")
        }
    }
}

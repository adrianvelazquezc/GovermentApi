//
//  GovermentLoginInteractor.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation

class GovermentLoginInteractor {
    var presenter: GovermentLoginPresenterProtocol?
}

extension GovermentLoginInteractor: GovermentLoginInteractorProtocol {
    func postNewUser(userInfo: UserInfo) {
//        Auth.auth().createUser(withEmail: email, password: password) {
//            (result, error) in
//            if let _ = result, error == nil {
//                self.ui?.animationView.play(completion: { finished in
//                    self.navigationController?.popViewController(animated: true)
//                })
//            } else {
//                self.ui?.mainView.backgroundColor = .clear
//                self.ui?.registerButton.isUserInteractionEnabled = true
//                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }
//        }
        
        presenter?.responseNewUserLogin()
    }
    
    func authenticateUserLogin(userInfo: UserInfo) {
//        Auth.auth().signIn(withEmail: email, password: password) {
//            (result, error) in
//            DispatchQueue.main.async {
//                if let _ = result, error == nil {
                    presenter?.responseUserLogin()
//                } else {
//                    presenter?.responseErrorInfo(error: error?.localizedDescription)
//                }
//            }
//        }
    }
}

//
//  GovermentLoginView.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

class GovermentLoginView: UIViewController {
    var presenter: GovermentLoginPresenterProtocol?
    private var ui: GovermentLoginViewUI?
    
    override func loadView() {
        ui = GovermentLoginViewUI(
            navigation: self.navigationController ?? UINavigationController(),
            delegate: self
        )
        view = ui
    }
}

extension GovermentLoginView: GovermentLoginViewProtocol {
    func notifyError(error: String) {
        DispatchQueue.main.async {
            let alert = Goverment_Alert(parentView: self.view, delegate: nil, title: "Error", message: error, isCloseEnabled: false, btnAcceptTitle: "OK")
            alert.show()
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            Goverment_ActivityIndicator.show(parent: self.view)
        }
    }
    
    func dissmissLoading() {
        DispatchQueue.main.async {
            Goverment_ActivityIndicator.remove(parent: self.view)
        }
    }
}

extension GovermentLoginView: GovermentLoginViewUIDelegate {
    func notifyRegisterUser(userInfo: UserInfo) {
        Goverment_NetworkAvailable.checkInternet { isConnected in
            DispatchQueue.main.async {
                if isConnected {
                    self.presenter?.requestNewUserLogin(userInfo: userInfo)
                } else {
                    self.notifyError(error: "Ops looks like there is a Network problem, please verify your connection and try again.")
                }
            }
        }
    }
    
    func notifyCheckUserLogin(userInfo: UserInfo) {
        Goverment_NetworkAvailable.checkInternet { isConnected in
            DispatchQueue.main.async {
                if isConnected {
                    self.presenter?.requestUserLogin(userInfo: userInfo)
                } else {
                    self.notifyError(error: "Ops looks like there is a Network problem, please verify your connection and try again.")
                }
            }
        }
    }
    
    func notifyCheckGoogleLogin() {
        Goverment_NetworkAvailable.checkInternet { isConnected in
            DispatchQueue.main.async {
                if isConnected {
                    self.presenter?.requestCheckGoogleLogin(present: self)
                } else {
                    self.notifyError(error: "Ops looks like there is a Network problem, please verify your connection and try again.")
                }
            }
        }
    }
    
    func notifyShowError(errorMessage: String) {
        notifyError(error: errorMessage)
    }
}

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
            delegate: self,
            isEnableActivated: presenter?.isUserAlredyLoggedIn() ?? false
        )
        view = ui
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
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
        self.presenter?.requestNewUserLogin(userInfo: userInfo)
    }
    
    func notifyCheckUserLogin(userInfo: UserInfo) {
        self.presenter?.requestUserLogin(userInfo: userInfo)
    }
    
    func notifyCheckGoogleLogin() {
        self.presenter?.requestCheckGoogleLogin(present: self)
    }
    
    func notifyLockInWithFaceBiometrics() {
        presenter?.requestLoginWithFaceBiometrics(present: self)
    }
    
    func notifyShowError(errorMessage: String) {
        notifyError(error: errorMessage)
    }
}

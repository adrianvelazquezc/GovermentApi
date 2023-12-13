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
        let alert = Goverment_Alert(parentView: self.view, delegate: nil, title: "Error", message: error, isCloseEnabled: false, btnAcceptTitle: "Retry")
            alert.show()
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
        presenter?.requestNewUserLogin(userInfo: userInfo)
    }
    
    func notifyCheckUserLogin(userInfo: UserInfo) {
        presenter?.requestUserLogin(userInfo: userInfo)
    }
    
    func notifyCheckGoogleLogin() {
        presenter?.requestCheckGoogleLogin()
    }
}

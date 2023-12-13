//
//  GovermentSplashView.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

class GovermentSplashView: UIViewController {
    var presenter: GovermentSplashPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        Goverment_ActivityIndicator.show(parent: self.view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.presenter?.requestInfo()
            Goverment_ActivityIndicator.remove(parent: self.view)
        }
    }
}

extension GovermentSplashView: GovermentSplashViewProtocol {
    func notifyError(error: String) {
        let alert = Goverment_Alert(parentView: self.view, delegate: self, title: "Error", message: error, isCloseEnabled: false, btnAcceptTitle: "Retry")
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

extension GovermentSplashView: Goverment_AlertProtocol {
    func notifyAccept() {
        presenter?.requestInfo()
    }
    
    func notifyCancel() {
        presenter?.requestInfo()
    }
}

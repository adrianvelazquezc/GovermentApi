//
//  GovermentSplashView.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit
import Lottie

class GovermentSplashView: UIViewController {
    var presenter: GovermentSplashPresenterProtocol?
    var isPresentingError = false
    
    public lazy var animationView: AnimationView = {
        let animation = AnimationView(name: "Goverment_Lottie_Loading")
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.loopMode = .playOnce
        return animation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(animationView)
        setConstraints()
        animationView.play { finished in
            Goverment_NetworkAvailable.checkInternet { (isConnected) in
                if isConnected {
                    self.presenter?.requestInfo()
                } else {
                    self.presenter?.responseErrorInfo(error: "Ops looks like there is a Network problem, please verify your conection and try again.")
                }
            }
        }
    }
    func setConstraints() {
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 200),
            animationView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}

extension GovermentSplashView: GovermentSplashViewProtocol {
    func notifyError(error: String) {
        isPresentingError = true
        DispatchQueue.main.async {
            let alert = Goverment_Alert(parentView: self.view, delegate: self, title: "Error", message: error, isCloseEnabled: false, btnAcceptTitle: "Retry")
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

extension GovermentSplashView: Goverment_AlertProtocol {
    func notifyAccept() {
        isPresentingError = false
        presenter?.requestInfo()
    }
    
    func notifyCancel() {
        isPresentingError = false
        presenter?.requestInfo()
    }
}

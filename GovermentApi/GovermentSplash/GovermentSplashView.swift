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
        animation.loopMode = .loop
        return animation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  #colorLiteral(red: 0.8861745, green: 0.9654828906, blue: 0.867546916, alpha: 1)
        view.addSubview(animationView)
        setConstraints()
        animationView.play()
        Goverment_NetworkAvailable.checkInternet { (isConnected) in
            if isConnected {
                self.presenter?.requestInfo()
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    self.presenter?.requestNextView()
                }
            } else {
                self.presenter?.responseErrorInfo(error: "Ops looks like there is a Network problem, please verify your conection and try again.")
            }
        }
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
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
}

extension GovermentSplashView: Goverment_AlertProtocol {
    func notifyAccept() {
        animationView.play()
        isPresentingError = false
        presenter?.requestInfo()
    }
    
    func notifyCancel() {
        animationView.play()
        isPresentingError = false
        presenter?.requestInfo()
    }
}

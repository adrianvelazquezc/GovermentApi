//
//  GovermentSplashMain.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

open class GovermentSplashMain {
    public static func createModule(navigation: UINavigationController) -> UIViewController {
        let viewController: GovermentSplashView? = GovermentSplashView()
        if let view = viewController {
            let presenter = GovermentSplashPresenter()
            let router = GovermentSplashRouter()
            let interactor = GovermentSplashInteractor()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            
            router.navigation = navigation
            
            interactor.presenter = presenter
            return view
        }
        return UIViewController()
    }
}

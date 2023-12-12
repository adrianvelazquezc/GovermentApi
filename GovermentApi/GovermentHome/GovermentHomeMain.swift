//
//  GovermentHomeMain.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

open class GovermentHomeMain {
    public static func createModule(navigation: UINavigationController, responseData: Response) -> UIViewController {
        let viewController: GovermentHomeView? = GovermentHomeView()
        if let view = viewController {
            let presenter = GovermentHomePresenter()
            let router = GovermentHomeRouter()
            let interactor = GovermentHomeInteractor()
            
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

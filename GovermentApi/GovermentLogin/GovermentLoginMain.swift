//
//  GovermentLoginMain.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

open class GovermentLoginMain {
    public static func createModule(navigation: UINavigationController, responseData: Response) -> UIViewController {
        let viewController: GovermentLoginView? = GovermentLoginView()
        if let view = viewController {
            let presenter = GovermentLoginPresenter()
            let router = GovermentLoginRouter()
            let interactor = GovermentLoginInteractor()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            
            router.navigation = navigation
            router.dataInfo = responseData
            
            interactor.presenter = presenter
            return view
        }
        return UIViewController()
    }
}

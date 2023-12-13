//
//  GovermentDetailsMain.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

open class GovermentDetailsMain {
    public static func createModule(navigation: UINavigationController, elementDetail: Result) -> UIViewController {
        let viewController: GovermentDetailsView? = GovermentDetailsView()
        if let view = viewController {
            let presenter = GovermentDetailsPresenter()
            let router = GovermentDetailsRouter()
            let interactor = GovermentDetailsInteractor()
            
            view.presenter = presenter
            view.elementDetail = elementDetail
            
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

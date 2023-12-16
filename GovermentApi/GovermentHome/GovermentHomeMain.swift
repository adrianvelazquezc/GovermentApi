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
            
            view.presenter = presenter
            view.dataInfo = responseData
            
            presenter.view = view
            presenter.router = router
            
            router.navigation = navigation
    
            return view
        }
        return UIViewController()
    }
}

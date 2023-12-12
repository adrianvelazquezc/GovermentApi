//
//  GovermentSplashRouter.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

class GovermentSplashRouter {
    var navigation: UINavigationController?
}

extension GovermentSplashRouter: GovermentSplashRouterProtocol {
    func navigateToNextView(responseData: Response) {
        if let navigationController = navigation {
            let viewController = GovermentLoginMain.createModule(navigation: navigationController, responseData: responseData)
            navigationController.pushViewController(viewController, animated: false)
        }
    }
}

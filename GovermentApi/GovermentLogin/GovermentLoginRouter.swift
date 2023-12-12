//
//  GovermentLoginRouter.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

class GovermentLoginRouter {
    var navigation: UINavigationController?
    internal var dataInfo: Response?
}

extension GovermentLoginRouter: GovermentLoginRouterProtocol {
    func navigateToNextView() {
        if let navigationController = navigation, let noNilDataInfo = dataInfo{
            let viewController = GovermentHomeMain.createModule(navigation: navigationController, responseData: noNilDataInfo)
            navigationController.pushViewController(viewController, animated: true)
        }
    }
}

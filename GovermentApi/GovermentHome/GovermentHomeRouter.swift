//
//  GovermentHomeRouter.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

class GovermentHomeRouter {
    var navigation: UINavigationController?
}

extension GovermentHomeRouter: GovermentHomeRouterProtocol {
    func navigateToElementDetails(element: Result) {
        if let navigationController = navigation {
            let viewController = GovermentDetailsMain.createModule(navigation: navigationController, elementDetail: element)
            navigationController.pushViewController(viewController, animated: true)
        }
    }
}

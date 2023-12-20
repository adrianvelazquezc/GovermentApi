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
            
            view.elementDetail = elementDetail
            return view
        }
        return UIViewController()
    }
}

//
//  Goverment_SplashView.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

class Goverment_SplashView: UIViewController {
    var completionHandler: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .link
        Goverment_ActivityIndicator.show(parent: self.view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            Goverment_ActivityIndicator.remove(parent: self.view)
            self.completionHandler?()
        }
    }
}

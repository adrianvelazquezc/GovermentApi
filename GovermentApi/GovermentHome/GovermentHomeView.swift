//
//  GovermentHomeView.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

class GovermentHomeView: UIViewController {
    var presenter: GovermentHomePresenterProtocol?
    private var ui: GovermentHomeViewUI?
    
    override func loadView() {
        ui = GovermentHomeViewUI(
            navigation: self.navigationController ?? UINavigationController(),
            delegate: self
        )
        view = ui
    }
}

extension GovermentHomeView: GovermentHomeViewProtocol {
    
}

extension GovermentHomeView: GovermentHomeViewUIDelegate {
    
}

//
//  GovermentDetailsView.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

class GovermentDetailsView: UIViewController {
    var presenter: GovermentDetailsPresenterProtocol?
    private var ui: GovermentDetailsViewUI?
    internal var elementDetail: Result?
    
    override func loadView() {
        if let noNilDetail = elementDetail {
            ui = GovermentDetailsViewUI(
                navigation: self.navigationController ?? UINavigationController(),
                delegate: self,
                elementDetail: noNilDetail
            )
            view = ui
        }
    }
}

extension GovermentDetailsView: GovermentDetailsViewProtocol {
    
}

extension GovermentDetailsView: GovermentDetailsViewUIDelegate {
    
}

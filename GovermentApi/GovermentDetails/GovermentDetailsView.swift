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
    
    func notifyError(error: String) {
        DispatchQueue.main.async {
            let alert = Goverment_Alert(parentView: self.view, delegate: nil, title: "Error", message: error, isCloseEnabled: false, btnAcceptTitle: "OK")
            alert.show()
        }
    }
}

extension GovermentDetailsView: GovermentDetailsViewProtocol {
    
}

extension GovermentDetailsView: GovermentDetailsViewUIDelegate {
    func notifyShareInfoToWhatsapp(info: String) {
        if let url = URL(string: "whatsapp://send?text=\(info.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        notifyError(error: "WhatsApp is not installed in this device")
                    }
                } else {
                    notifyError(error: "Error building Whatsapp URL")
                }
    }
}

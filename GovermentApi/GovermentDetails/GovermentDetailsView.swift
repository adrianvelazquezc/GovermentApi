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
    func notifyShareInfoToWhatsapp(info: String) {
        if let url = URL(string: "whatsapp://send?text=\(info.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    } else {
                        print("WhatsApp no está instalado en el dispositivo.")
                    }
                } else {
                    print("Error al construir la URL de WhatsApp.")
                }
    }
}

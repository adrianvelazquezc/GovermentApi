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
    internal var dataInfo: Response?
    
    override func loadView() {
        if let noNilInfo = dataInfo {
            ui = GovermentHomeViewUI(
                navigation: self.navigationController ?? UINavigationController(),
                delegate: self,
                responseData: noNilInfo
            )
            view = ui
        }
    }
}

extension GovermentHomeView: GovermentHomeViewProtocol {
    
}

extension GovermentHomeView: GovermentHomeViewUIDelegate {
    func getFilterString(filter: String) {
        if filter.isEmpty {
            ui?.elementList = ui?.originalElementList ?? [Result]()
        } else {
            ui?.elementList = ui?.originalElementList?.filter({ $0.id.localizedCaseInsensitiveContains(filter) }) ?? []
        }
        ui?.tableView.reloadData()
    }
}

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
    internal var counterList = 20
    
    override func loadView() {
        if let noNilInfo = dataInfo {
            ui = GovermentHomeViewUI(
                navigation: self.navigationController ?? UINavigationController(),
                delegate: self,
                responseData: Array(noNilInfo.results.prefix(counterList))
            )
            view = ui
        }
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}

extension GovermentHomeView: GovermentHomeViewProtocol {
    func notifyError(error: String) {
        DispatchQueue.main.async {
            let alert = Goverment_Alert(parentView: self.view ?? UIView(), delegate: nil, title: "Error", message: error, isCloseEnabled: false, btnAcceptTitle: "OK")
            alert.show()
        }
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            Goverment_ActivityIndicator.show(parent: self.view)
        }
    }
    
    func dissmissLoading() {
        DispatchQueue.main.async {
            Goverment_ActivityIndicator.remove(parent: self.view)
        }
    }
}

extension GovermentHomeView: GovermentHomeViewUIDelegate {
    func addNewValues() {
        if let noNilInfo = dataInfo {
            let endIndex = counterList + 10
            var tempList: [Result] = []
            for index in counterList..<endIndex {
                if index < noNilInfo.results.count {
                    tempList.append(noNilInfo.results[index])
                }
            }
            print("counterList: \(counterList), endIndex: \(endIndex), total: \(noNilInfo.pagination.total)")

            guard counterList < noNilInfo.pagination.total else {
                ui?.isSendingRequest = false
                return
            }
            ui?.addNewItemsFrom(list: tempList)
            counterList = endIndex
        }
    }

    
    func notifyGetFilterString(filter: String) {
        if filter.isEmpty {
            ui?.elementList = ui?.originalElementList ?? [Result]()
        } else {
            if let ui = ui {
                switch ui.currentSearch {
                case .id:
                    ui.elementList = ui.originalElementList.filter { $0.id.localizedCaseInsensitiveContains(filter) }
                case .organization:
                    ui.elementList = ui.originalElementList.filter { $0.organization.localizedCaseInsensitiveContains(filter) }
                case .urlLabel:
                    ui.elementList = ui.originalElementList.filter { $0.url.localizedCaseInsensitiveContains(filter) }
                }
            } 
        }
        ui?.tableView.reloadData()
    }
    
    func notifyShowInfo(element: Result) {
        presenter?.requestElementDetails(element: element)
    }
}

//
//  GovermentHomeProtocols.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation

protocol GovermentHomeViewProtocol: AnyObject {
    func notifyError(error: String)
    func showLoading()
    func dissmissLoading()
}

protocol GovermentHomeInteractorProtocol: AnyObject {
    
}

protocol GovermentHomePresenterProtocol: AnyObject {
    func requestElementDetails(element: Result)
}

protocol GovermentHomeRouterProtocol: AnyObject {
    func navigateToElementDetails(element: Result)
}

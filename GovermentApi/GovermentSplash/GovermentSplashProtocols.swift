//
//  GovermentSplashProtocols.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation

protocol GovermentSplashViewProtocol: AnyObject {
    func notifyError(error: String)
    func showLoading()
    func dissmissLoading()
}

protocol GovermentSplashInteractorProtocol: AnyObject {
    func fetchData()
}

protocol GovermentSplashPresenterProtocol: AnyObject {
    func requestInfo()
    func responseInfo(responseData: Response)
}

protocol GovermentSplashRouterProtocol: AnyObject {
    func navigateToNextView(responseData: Response)
}

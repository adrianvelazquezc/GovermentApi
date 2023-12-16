//
//  GovermentSplashProtocols.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation

protocol GovermentSplashViewProtocol: AnyObject {
    func notifyError(error: String)
}

protocol GovermentSplashInteractorProtocol: AnyObject {
    func fetchData()
}

protocol GovermentSplashPresenterProtocol: AnyObject {
    func requestInfo()
    func responseInfo(responseData: Response)
    func responseErrorInfo(error: String)
    func requestNextView()
}

protocol GovermentSplashRouterProtocol: AnyObject {
    func navigateToNextView(responseData: Response)
}

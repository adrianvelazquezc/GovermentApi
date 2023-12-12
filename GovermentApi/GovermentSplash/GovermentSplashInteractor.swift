//
//  GovermentSplashInteractor.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation

class GovermentSplashInteractor {
    var presenter: GovermentSplashPresenterProtocol?
}

extension GovermentSplashInteractor: GovermentSplashInteractorProtocol {
    func fetchData() {
        let urlString = "https://api.datos.gob.mx/v1/gobmx.facts?page=1&pageSize=10"
        if let urlObject = URL(string: urlString){
            var urlRequest = URLRequest(url: urlObject)
            urlRequest.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, responseError in
                if let response = responseData {
                    if let jsonResponse = try? JSONDecoder().decode(Response.self, from: response) {
                        DispatchQueue.main.async {
                            self.presenter?.responseInfo(responseData: jsonResponse)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

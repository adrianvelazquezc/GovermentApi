//
//  GovermentSplashInteractor.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import Foundation
import FirebaseFirestore

class GovermentSplashInteractor {
    var presenter: GovermentSplashPresenterProtocol?
}

extension GovermentSplashInteractor: GovermentSplashInteractorProtocol {
    func fetchData() {
        let urlString = "https://api.datos.gob.mx/v1/gobmx.facts?page=1&pageSize=1000"
        if let urlObject = URL(string: urlString){
            var urlRequest = URLRequest(url: urlObject)
            urlRequest.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: urlRequest) { responseData, responseCode, error in
                if let httpResponse = responseCode as? HTTPURLResponse {
                    let statusCode = httpResponse.statusCode
                    if statusCode != 200 {
                        DispatchQueue.main.async {
                            self.presenter?.responseErrorInfo(error: "Looks like there is a problem, error code \(statusCode)")
                        }
                    }
                }
                if let error = error {
                    DispatchQueue.main.async {
                        self.presenter?.responseErrorInfo(error: error.localizedDescription)
                    }
                    return
                }
                if let response = responseData {
                    do {
                        let jsonResponse = try JSONDecoder().decode(Response.self, from: response)
                        DispatchQueue.main.async {
                            self.saveData(responseData: jsonResponse)
                        }
                    } catch let decodingError {
                        DispatchQueue.main.async {
                            self.presenter?.responseErrorInfo(error: decodingError.localizedDescription)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    private func saveData(responseData: Response) {
        let db = Firestore.firestore()
        
        for result in responseData.results {
            let resultData: [String: Any] = [
                "id": result.id,
                "dateInsert": result.dateInsert,
                "slug": result.slug,
                "columns": result.columns,
                "fact": result.fact,
                "organization": result.organization,
                "resource": result.resource,
                "url": result.url,
                "operations": result.operations,
                "dataset": result.dataset,
                "createdAt": result.createdAt
            ]
            
            let resultRef = db.collection("results").document(result.id)
            resultRef.setData(resultData) { error in
                if let error = error {
                    self.presenter?.responseErrorInfo(error: error.localizedDescription)
                } else {
                    self.presenter?.responseInfo(responseData: responseData)
                }
            }
        }
    }
}

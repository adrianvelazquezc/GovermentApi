//
//  GovermentDetailsView.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit
import CoreLocation

class GovermentDetailsView: UIViewController {
    var presenter: GovermentDetailsPresenterProtocol?
    private var ui: GovermentDetailsViewUI?
    internal var elementDetail: Result?
    let locationManager = CLLocationManager()
    
    override func loadView() {
        if let noNilDetail = elementDetail {
            ui = GovermentDetailsViewUI(
                navigation: self.navigationController ?? UINavigationController(),
                delegate: self,
                elementDetail: noNilDetail
            )
            view = ui
        }
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidLoad() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    func notifyError(error: String) {
        DispatchQueue.main.async {
            let alert = Goverment_Alert(parentView: self.view ?? UIView(), delegate: nil, title: "Error", message: error, isCloseEnabled: false, btnAcceptTitle: "OK")
            alert.show()
        }
    }
}

extension GovermentDetailsView: GovermentDetailsViewProtocol {
    
}

extension GovermentDetailsView: GovermentDetailsViewUIDelegate {
    func notifyShareInfoToWhatsapp(info: String) {
        if let currentLocation = locationManager.location {
            let latitude = currentLocation.coordinate.latitude
            let longitude = currentLocation.coordinate.longitude
            
            let infoWithLocation = "\(info)\nCurrent Location: Lat \(latitude), Lon \(longitude)"
            
            if let url = URL(string: "whatsapp://send?text=\(infoWithLocation.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    notifyError(error: "WhatsApp is not installed in this device")
                }
            } else {
                notifyError(error: "Error building WhatsApp URL")
            }
        } else {
            notifyError(error: "Location information not available")
        }
    }
}

extension GovermentDetailsView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        notifyError(error: error.localizedDescription)
    }
}

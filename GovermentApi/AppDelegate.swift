//
//  AppDelegate.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit
import CoreLocation
import FirebaseCore
import FirebaseFirestore
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var locationManager = CLLocationManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let nav = UINavigationController()
        nav.isNavigationBarHidden = true
        
        FirebaseApp.configure()
        let _ = Firestore.firestore()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        locationManager.requestAlwaysAuthorization()
        requestLocationPermissionIfNeeded()
        
        let vc = GovermentSplashMain.createModule(navigation: nav)
        nav.pushViewController(vc, animated: true)
        
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
    
    private func requestLocationPermissionIfNeeded() {
            switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse, .authorizedAlways:
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .denied, .restricted:
                showAlertForLocationPermissionError()
            @unknown default:
                break
            }
        }
    
    private func showAlertForLocationPermissionError() {
        let errorAlert = Goverment_Alert(parentView: self.window!, delegate: self, title: "Error", message: "Location permissions are required for this app. Please enable them in your device settings.", isCloseEnabled: false, btnAcceptTitle: "OK")
        errorAlert.show()
    }
}

extension AppDelegate: Goverment_AlertProtocol {
    func notifyAccept() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        if UIApplication.shared.canOpenURL(settingsURL) {
            UIApplication.shared.open(settingsURL, completionHandler: nil)
        }
    }
}

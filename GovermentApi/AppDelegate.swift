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
    let locationManager = CLLocationManager()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let nav = UINavigationController()
        nav.isNavigationBarHidden = true
        
        FirebaseApp.configure()

        let db = Firestore.firestore()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        locationManager.requestAlwaysAuthorization()
        let vc = GovermentSplashMain.createModule(navigation: nav)
        nav.pushViewController(vc, animated: true)
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}

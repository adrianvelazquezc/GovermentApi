//
//  AppDelegate.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let nav = UINavigationController()
        nav.isNavigationBarHidden = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        let vc = GovermentSplashMain.createModule(navigation: nav)
        nav.pushViewController(vc, animated: true)
        return true
    }
    
}


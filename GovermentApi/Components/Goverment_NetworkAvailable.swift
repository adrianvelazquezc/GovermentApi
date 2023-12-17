//
//  Goverment_NetworkAvailable.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit
import Network

class Goverment_NetworkAvailable {
    class func checkInternet(completionHandler: @escaping (Bool) -> Void) {
        let monitor = NWPathMonitor()
        
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                completionHandler(true)
            }
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
}

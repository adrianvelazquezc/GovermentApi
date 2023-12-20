//
//  Goverment_ActivityIndicator.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

open class Goverment_ActivityIndicator {
    
    private static let tagView = -1
    
    private static var gobIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.tintColor = .gray
        indicator.transform = CGAffineTransform(scaleX: 3, y: 3)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    public static func show(parent: UIView) {
        parent.endEditing(true)
        if parent.viewWithTag(tagView) != nil {
            return
        }
        parent.isUserInteractionEnabled = false
        let mainView = UIView(frame: (parent.frame))
        mainView.backgroundColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1221039245)
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mainView.tag = tagView
        
        mainView.addSubview(gobIndicator)
        parent.addSubview(mainView)
        gobIndicator.startAnimating()
        
        NSLayoutConstraint.activate([
            gobIndicator.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            gobIndicator.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            gobIndicator.heightAnchor.constraint(equalToConstant: 100),
            gobIndicator.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    public static func remove(parent: UIView) {
        parent.endEditing(true)
        parent.isUserInteractionEnabled = true
        if let loaderView = parent.viewWithTag(tagView) {
            loaderView.removeFromSuperview()
        }
        gobIndicator.stopAnimating()
    }
    
    public static func isLoading() -> Bool {
        return gobIndicator.isAnimating
    }
}

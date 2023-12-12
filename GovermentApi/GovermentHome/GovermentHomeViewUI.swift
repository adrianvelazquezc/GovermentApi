//
//  GovermentHomeViewUI.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

protocol GovermentHomeViewUIDelegate {
    
}

class GovermentHomeViewUI: UIView {
    var delegate: GovermentHomeViewUIDelegate?
    var navigationController: UINavigationController?
    
    public convenience init(navigation: UINavigationController,delegate: GovermentHomeViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            setUI()
            setConstraints()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI() {
        backgroundColor = .white
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}

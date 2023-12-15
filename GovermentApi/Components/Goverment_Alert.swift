//
//  Goverment_Alert.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

@objc public protocol Goverment_AlertProtocol: AnyObject {
    @objc optional func notifyAccept()
    @objc optional func notifyCancel()
}

open class Goverment_Alert: UIView {
    public weak var parentView: UIView?
    private weak var delegate : Goverment_AlertProtocol?
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowColor = UIColor.clear.cgColor
        view.layer.backgroundColor = UIColor.white.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 10
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var lbTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .black
        label.numberOfLines = 3
        label.textAlignment = .center
        label.minimumScaleFactor = 0.6
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lbDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 3
        label.textColor = .black
        label.textAlignment = .center
        label.minimumScaleFactor = 0.6
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var btnAccept: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(continueAction(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var btnClose: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(continueAction(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public convenience init(parentView: UIView,
                            delegate: Goverment_AlertProtocol?,
                            icon: String = "alertWarningIcon",
                            title: String,
                            message: String,
                            isCloseEnabled: Bool = true,
                            btnAcceptTitle: String = "Accept"
    ){
        
        self.init(frame: UIScreen.main.bounds)
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        self.parentView = parentView
        self.delegate = delegate
        btnClose.isHidden = !isCloseEnabled
        btnAccept.setTitle(btnAcceptTitle, for: .normal)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideAlertView))
        addGestureRecognizer(tap)
        
        setUI(title: title, description: message)
        buildConstraint()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setUI(title: String, description: String) {
        lbTitle.text = title
        lbDescription.text = description
        stackView.addArrangedSubview(lbTitle)
        stackView.addArrangedSubview(lbDescription)
        
        cardView.addSubview(btnClose)
        cardView.addSubview(stackView)
        cardView.addSubview(separatorView)
        cardView.addSubview(btnAccept)
        
        addSubview(cardView)
    }
    
    
    fileprivate func buildConstraint(){
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            cardView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            btnClose.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10.0),
            btnClose.heightAnchor.constraint(equalToConstant: 40.0),
            btnClose.widthAnchor.constraint(equalToConstant: 40.0),
            btnClose.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 0.0),
            
            stackView.topAnchor.constraint(equalTo: btnClose.bottomAnchor, constant: 0.0),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -30),
            
            separatorView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10.0),
            separatorView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10.0),
            separatorView.heightAnchor.constraint(equalToConstant: 1.0),
            separatorView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10.0),
            
            btnAccept.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            btnAccept.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 40),
            btnAccept.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -40),
            btnAccept.heightAnchor.constraint(equalToConstant: 50),
            btnAccept.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20.0)
        ])
    }
    
    @objc func continueAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.alpha = 0
        } completion: { completed in
            self.delegate?.notifyAccept?()
            self.parentView?.removeFromSuperview()
            self.removeFromSuperview()
        }
    }
    
    @objc func hideAlertView(){
        UIView.animate(withDuration: 0.3) {
            self.alpha = 0
        } completion: { completed in
            self.parentView?.removeFromSuperview()
            self.delegate?.notifyCancel?()
            self.removeFromSuperview()
        }
    }
    
    public func show() {
        alpha = 0
        parentView?.endEditing(true)
        parentView?.addSubview(self)
        
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
        }
    }
}

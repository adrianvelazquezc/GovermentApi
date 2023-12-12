//
//  GovermentLoginViewUI.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

protocol GovermentLoginViewUIDelegate {
    func notifyCheckUserLogin(userInfo: UserInfo)
    func notifyRegisterUser(userInfo: UserInfo)
    func notifyCheckGoogleLogin()
}

class GovermentLoginViewUI: UIView {
    var delegate: GovermentLoginViewUIDelegate?
    var navigationController: UINavigationController?
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var userNameTextField: Goverment_TextField = {
        let textField = Goverment_TextField(placeholder: "User")
        textField.delegate = self
        return textField
    }()

    lazy var userPasswordTextField: Goverment_TextField = {
        let textField = Goverment_TextField(placeholder: "Password")
        textField.delegate = self
        return textField
    }()
    
    lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.backgroundColor =   #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.isEnabled = false
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registerTapped(_:)), for: .touchUpInside)
        button.backgroundColor =   #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.isEnabled = false
        return button
    }()
    
    public convenience init(navigation: UINavigationController,delegate: GovermentLoginViewUIDelegate) {
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            let gestoTap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard(_:)))
            self.addGestureRecognizer(gestoTap)
            
            setUI()
            setConstraints()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI(){
        backgroundColor = .white
        addSubview(containerView)
        containerView.addSubview(userNameTextField)
        containerView.addSubview(userPasswordTextField)
        containerView.addSubview(continueButton)
        containerView.addSubview(registerButton)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            userNameTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            userNameTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            userNameTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            userPasswordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20),
            userPasswordTextField.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor),
            userPasswordTextField.trailingAnchor.constraint(equalTo: userNameTextField.trailingAnchor),
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            continueButton.topAnchor.constraint(equalTo: userPasswordTextField.bottomAnchor, constant: 50),
            continueButton.leadingAnchor.constraint(equalTo: userNameTextField.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            continueButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            
            registerButton.topAnchor.constraint(equalTo: continueButton.topAnchor),
            registerButton.heightAnchor.constraint(equalTo: continueButton.heightAnchor),
            registerButton.widthAnchor.constraint(equalTo: continueButton.widthAnchor),
            registerButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
        ])
    }
    
    @objc func dissmisKeyboard(_ sender: UITapGestureRecognizer){
        self.endEditing(true)
    }
    
    @objc func buttonTapped(_ sender: UITapGestureRecognizer) {
        delegate?.notifyCheckUserLogin(userInfo: UserInfo(userName: userNameTextField.text ?? "", userPassword: userPasswordTextField.text ?? ""))
    }
    
    @objc func registerTapped(_ sender: UIControl){
        self.delegate?.notifyRegisterUser(userInfo: UserInfo(userName: userNameTextField.text ?? "", userPassword: userPasswordTextField.text ?? ""))
    }
}

extension GovermentLoginViewUI: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        continueButton.isEnabled = (!(userNameTextField.text?.isEmpty ?? false) && !(userPasswordTextField.text?.isEmpty ?? false))
        registerButton.isEnabled = (!(userNameTextField.text?.isEmpty ?? false) && !(userPasswordTextField.text?.isEmpty ?? false))
        if continueButton.isEnabled {
            continueButton.backgroundColor =   #colorLiteral(red: 0.4548825622, green: 0.8329617977, blue: 0.4634124041, alpha: 1)
            registerButton.backgroundColor =   #colorLiteral(red: 0.4548825622, green: 0.8329617977, blue: 0.4634124041, alpha: 1)
        } else {
            continueButton.backgroundColor =   #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            registerButton.backgroundColor =   #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
}

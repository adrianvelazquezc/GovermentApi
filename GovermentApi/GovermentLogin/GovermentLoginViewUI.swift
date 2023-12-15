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
    func notifyShowError(errorMessage: String)
}

class GovermentLoginViewUI: UIView {
    var delegate: GovermentLoginViewUIDelegate?
    var navigationController: UINavigationController?
    
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Welcome"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var userlMalTextField: Goverment_TextField = {
        let textField = Goverment_TextField(placeholder: "Email")
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
    
    lazy var googleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign in with Google", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8.0
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        let googleLogo = UIImageView(image: UIImage(named: "googleIcon"))
        googleLogo.contentMode = .scaleAspectFit
        button.addSubview(googleLogo)
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
        googleLogo.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 16).isActive = true
        googleLogo.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        googleLogo.widthAnchor.constraint(equalToConstant: 24).isActive = true
        googleLogo.heightAnchor.constraint(equalToConstant: 24).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(googleTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    public convenience init(navigation: UINavigationController, delegate: GovermentLoginViewUIDelegate?) {
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            let gestoTap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard(_:)))
            addGestureRecognizer(gestoTap)
            
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
        addSubview(welcomeLabel)
        addSubview(containerView)
        containerView.addSubview(userlMalTextField)
        containerView.addSubview(userPasswordTextField)
        containerView.addSubview(continueButton)
        containerView.addSubview(registerButton)
        containerView.addSubview(googleButton)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            welcomeLabel.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -20),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            userlMalTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            userlMalTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            userlMalTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            userlMalTextField.heightAnchor.constraint(equalToConstant: 50),
            
            userPasswordTextField.topAnchor.constraint(equalTo: userlMalTextField.bottomAnchor, constant: 20),
            userPasswordTextField.leadingAnchor.constraint(equalTo: userlMalTextField.leadingAnchor),
            userPasswordTextField.trailingAnchor.constraint(equalTo: userlMalTextField.trailingAnchor),
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            continueButton.topAnchor.constraint(equalTo: userPasswordTextField.bottomAnchor, constant: 50),
            continueButton.leadingAnchor.constraint(equalTo: userlMalTextField.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: continueButton.topAnchor),
            registerButton.heightAnchor.constraint(equalTo: continueButton.heightAnchor),
            registerButton.widthAnchor.constraint(equalTo: continueButton.widthAnchor),
            registerButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            
            googleButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 50),
            googleButton.leadingAnchor.constraint(equalTo: userlMalTextField.leadingAnchor),
            googleButton.trailingAnchor.constraint(equalTo: userlMalTextField.trailingAnchor),
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            googleButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
        ])
    }
    
    @objc func dissmisKeyboard(_ sender: UITapGestureRecognizer){
        self.endEditing(true)
    }
    
    @objc func buttonTapped(_ sender: UITapGestureRecognizer) {
        delegate?.notifyCheckUserLogin(userInfo: UserInfo(userMail: userlMalTextField.text ?? "", userPassword: userPasswordTextField.text ?? ""))
    }
    
    @objc func registerTapped(_ sender: UIControl) {
        if let password = userPasswordTextField.text, let email = userlMalTextField.text, email.isEmail() {
            self.delegate?.notifyRegisterUser(userInfo: UserInfo(userMail: email, userPassword: password))
        } else {
            delegate?.notifyShowError(errorMessage: "Please use a valid email example: example@domain.extension")
        }
    }
    
    @objc func googleTapped(_ sender: UIControl) {
        delegate?.notifyCheckGoogleLogin()
    }
}

extension GovermentLoginViewUI: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        continueButton.isEnabled = (!(userlMalTextField.text?.isEmpty ?? false) && !(userPasswordTextField.text?.isEmpty ?? false))
        registerButton.isEnabled = continueButton.isEnabled
        if continueButton.isEnabled {
            continueButton.backgroundColor =   #colorLiteral(red: 0.4548825622, green: 0.8329617977, blue: 0.4634124041, alpha: 1)
            registerButton.backgroundColor =   #colorLiteral(red: 0.4548825622, green: 0.8329617977, blue: 0.4634124041, alpha: 1)
        } else {
            continueButton.backgroundColor =   #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            registerButton.backgroundColor =   #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
    }
}

//extension GovermentLoginViewUI: GIDSignInDelegate {
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//        if let error = error {
//            delegate?.notifyShowError(errorMessage: "Error during Google Sign-In: \(error.localizedDescription)")
//        } else {
//            delegate?.notifyCheckGoogleLogin()
//        }
//    }
//}

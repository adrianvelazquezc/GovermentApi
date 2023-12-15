//
//  GovermentLoginViewUI.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit
import Lottie

protocol GovermentLoginViewUIDelegate {
    func notifyCheckUserLogin(userInfo: UserInfo)
    func notifyRegisterUser(userInfo: UserInfo)
    func notifyCheckGoogleLogin()
    func notifyShowError(errorMessage: String)
    func notifyLockInWithFingerBiometrics()
    func notifyLockInWithFaceBiometrics()
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
    
    private var containerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var userlMailTextField: Goverment_TextField = {
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
        button.layer.cornerRadius = 8.0
        button.layer.borderWidth = 2.0
        button.backgroundColor =   #colorLiteral(red: 0.8476062417, green: 0.8133529425, blue: 0.7713170648, alpha: 1)
        button.layer.borderColor =  #colorLiteral(red: 0.2507791519, green: 0.2509659529, blue: 0.2881665826, alpha: 1)
        button.isEnabled = false
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registerTapped(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 8.0
        button.layer.borderWidth = 2.0
        button.backgroundColor =   #colorLiteral(red: 0.8476062417, green: 0.8133529425, blue: 0.7713170648, alpha: 1)
        button.layer.borderColor =  #colorLiteral(red: 0.2507791519, green: 0.2509659529, blue: 0.2881665826, alpha: 1)
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
        button.layer.borderWidth = 2.0
        button.layer.borderColor =  #colorLiteral(red: 0.2507791519, green: 0.2509659529, blue: 0.2881665826, alpha: 1)
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
    
    var faceBiometrictsButton: AnimationView = {
        let animation = AnimationView(name: "Goverment_Lottie_faceBiometric")
        animation.translatesAutoresizingMaskIntoConstraints = false
        animation.loopMode = .loop
        animation.play()
        animation.isHidden = true
        return animation
    }()
    
    lazy var fingerBiometrictsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enable biometrics", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(biometricsFingerTapped(_:)), for: .touchUpInside)
        button.layer.cornerRadius = 8.0
        button.layer.borderWidth = 2.0
        button.backgroundColor =    #colorLiteral(red: 0.2954775095, green: 0.4989314675, blue: 0.4466043711, alpha: 1)
        button.layer.borderColor =  #colorLiteral(red: 0.2507791519, green: 0.2509659529, blue: 0.2881665826, alpha: 1)
        return button
    }()
    
    public convenience init(navigation: UINavigationController, delegate: GovermentLoginViewUIDelegate?) {
        self.init()
        self.delegate = delegate
        self.navigationController = navigation
        
        let gestoTap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard(_:)))
        addGestureRecognizer(gestoTap)
        let biometricsFaceTap = UITapGestureRecognizer(target: self, action: #selector(biometricsFaceTapped))
        faceBiometrictsButton.addGestureRecognizer(biometricsFaceTap)
        
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
        backgroundColor =  #colorLiteral(red: 0.8861745, green: 0.9654828906, blue: 0.867546916, alpha: 1)
        addSubview(welcomeLabel)
        addSubview(containerView)
        containerView.addArrangedSubview(userlMailTextField)
        containerView.addArrangedSubview(userPasswordTextField)
        containerView.addArrangedSubview(continueButton)
        containerView.addArrangedSubview(registerButton)
        containerView.addArrangedSubview(googleButton)
        containerView.addArrangedSubview(faceBiometrictsButton)
        addSubview(fingerBiometrictsButton)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            welcomeLabel.bottomAnchor.constraint(equalTo: containerView.topAnchor, constant: -20),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            userlMailTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            userlMailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            userlMailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            userlMailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            userPasswordTextField.topAnchor.constraint(equalTo: userlMailTextField.bottomAnchor, constant: 20),
            userPasswordTextField.leadingAnchor.constraint(equalTo: userlMailTextField.leadingAnchor),
            userPasswordTextField.trailingAnchor.constraint(equalTo: userlMailTextField.trailingAnchor),
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            continueButton.topAnchor.constraint(equalTo: userPasswordTextField.bottomAnchor, constant: 50),
            continueButton.leadingAnchor.constraint(equalTo: userlMailTextField.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            continueButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.topAnchor.constraint(equalTo: continueButton.topAnchor),
            registerButton.heightAnchor.constraint(equalTo: continueButton.heightAnchor),
            registerButton.widthAnchor.constraint(equalTo: continueButton.widthAnchor),
            registerButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 20),
            
            googleButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 50),
            googleButton.leadingAnchor.constraint(equalTo: userlMailTextField.leadingAnchor),
            googleButton.trailingAnchor.constraint(equalTo: userlMailTextField.trailingAnchor),
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            googleButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            
            faceBiometrictsButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            faceBiometrictsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            faceBiometrictsButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            faceBiometrictsButton.heightAnchor.constraint(equalToConstant: 260),
            faceBiometrictsButton.widthAnchor.constraint(equalToConstant: 260),
            
            fingerBiometrictsButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 30),
            fingerBiometrictsButton.heightAnchor.constraint(equalToConstant: 50),
            fingerBiometrictsButton.widthAnchor.constraint(equalToConstant: 200),
            fingerBiometrictsButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    @objc func dissmisKeyboard(_ sender: UITapGestureRecognizer) {
        self.endEditing(true)
    }
    
    @objc func biometricsFaceTapped(_ sender: UITapGestureRecognizer) {
        delegate?.notifyLockInWithFaceBiometrics()
    }
    
    @objc func biometricsFingerTapped(_ sender: UITapGestureRecognizer) {
        userlMailTextField.isHidden = !userlMailTextField.isHidden
        userPasswordTextField.isHidden = userlMailTextField.isHidden
        continueButton.isHidden = userlMailTextField.isHidden
        registerButton.isHidden = userlMailTextField.isHidden
        googleButton.isHidden = userlMailTextField.isHidden
        faceBiometrictsButton.isHidden = !faceBiometrictsButton.isHidden
        fingerBiometrictsButton.setTitle(faceBiometrictsButton.isHidden ? "Enable biometrics" : "Disable biometrics", for: .normal)
        layoutSubviews()
        layoutIfNeeded()
    }
    
    @objc func buttonTapped(_ sender: UITapGestureRecognizer) {
        if let password = userPasswordTextField.text, let email = userlMailTextField.text, email.isEmail() {
            self.delegate?.notifyCheckUserLogin(userInfo: UserInfo(userMail: email, userPassword: password))
        } else {
            delegate?.notifyShowError(errorMessage: "Please use a valid email example: example@domain.extension")
        }
    }
    
    @objc func registerTapped(_ sender: UIControl) {
        if let password = userPasswordTextField.text, let email = userlMailTextField.text, email.isEmail() {
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
        continueButton.isEnabled = (!(userlMailTextField.text?.isEmpty ?? false) && !(userPasswordTextField.text?.isEmpty ?? false))
        registerButton.isEnabled = continueButton.isEnabled
        if continueButton.isEnabled {
            continueButton.backgroundColor =   #colorLiteral(red: 0.2954775095, green: 0.4989314675, blue: 0.4466043711, alpha: 1)
            registerButton.backgroundColor =   #colorLiteral(red: 0.2954775095, green: 0.4989314675, blue: 0.4466043711, alpha: 1)
        } else {
            continueButton.backgroundColor =   #colorLiteral(red: 0.8476062417, green: 0.8133529425, blue: 0.7713170648, alpha: 1)
            registerButton.backgroundColor =   #colorLiteral(red: 0.8476062417, green: 0.8133529425, blue: 0.7713170648, alpha: 1)
        }
    }
}

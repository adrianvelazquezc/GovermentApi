//
//  Goverment_DropdownView.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

public protocol Goverment_DropdownViewProtocol {
    func didChoiceFilter(_ elementToFilter: String)
}

open class Goverment_DropdownView: UIView {
    internal var delegate: Goverment_DropdownViewProtocol?
    public var heightSize = 0.0
    public var parent: UIView?
    private var scrollViewHeightConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private var isShowing = false
    
    private lazy var choosedButton: UIButton = {
        let button = UIButton()
        button.setTitle("v", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(selectAnOption), for: .touchUpInside)
        return button
    }()
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.bounces = false
        return scrollView
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 5.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    public convenience init(incomingElementName: [String], parent: UIView){
        self.init()
        self.parent = parent
        addSubview(choosedButton)
        self.parent?.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        if incomingElementName.count > 3 {
            heightSize = (3.5 * 40)
        } else {
            heightSize = Double((incomingElementName.count * 40))
        }
        setSecondsConstrains()
        
        for element in incomingElementName {
            let titleForGender = Goverment_DropdownViewButton(element)
            titleForGender.translatesAutoresizingMaskIntoConstraints = false
            titleForGender.backgroundColor = .link
            titleForGender.layer.cornerRadius = 15
            titleForGender.addTarget(self, action: #selector(genderChoosedTapped(_:)), for: .touchUpInside)
            
            stackView.addArrangedSubview(titleForGender)
            NSLayoutConstraint.activate([
                titleForGender.heightAnchor.constraint(equalToConstant: 40),
                titleForGender.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
                titleForGender.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
                titleForGender.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            ])
        }
    }
    
    @objc func selectAnOption(){
        if !isShowing {
            UIView.animate(withDuration: 0.2) {
                self.scrollViewHeightConstraint.constant = self.heightSize
                self.parent?.layoutIfNeeded()
                self.isShowing = true
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                self.scrollViewHeightConstraint.constant = 0
                self.parent?.layoutIfNeeded()
                self.isShowing = false
            }
        }
        
    }
    @objc func genderChoosedTapped(_ sender: Goverment_DropdownViewButton){
        let elementName = sender.elementName
        UIView.animate(withDuration: 0.2) {
            self.scrollViewHeightConstraint.constant = 0
            self.parent?.layoutIfNeeded()
            self.isShowing = false
        }
        delegate?.didChoiceFilter(elementName)
    }
    
    public func setUi(reference: UIView){
        scrollViewHeightConstraint = scrollView.heightAnchor.constraint(equalToConstant: 0)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: reference.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: reference.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: reference.trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: reference.widthAnchor),
            scrollViewHeightConstraint,
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: reference.widthAnchor),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setSecondsConstrains(){
        
        NSLayoutConstraint.activate([
            choosedButton.topAnchor.constraint(equalTo: topAnchor),
            choosedButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            choosedButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            choosedButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func hiddeWhenTapped(){
        UIView.animate(withDuration: 1.0) {
            self.scrollViewHeightConstraint.constant = 0
            self.parent?.layoutIfNeeded()
        }
    }
}

class Goverment_DropdownViewButton: UIButton {
    public var elementName: String = ""
    
    public convenience init(_ elementName: String){
        self.init()
        self.elementName = elementName
        setTitle(elementName, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

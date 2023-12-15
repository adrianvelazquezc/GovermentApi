//
//  Goverment_TextField.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

class Goverment_TextField: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.borderColor =  #colorLiteral(red: 0.2507791519, green: 0.2509659529, blue: 0.2881665826, alpha: 1)
        self.placeholder = placeholder
        layer.borderWidth = 2
        layer.cornerRadius = 10
        textColor = .black
        backgroundColor = .white
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: frame.size.height))
        self.leftView = leftView
        leftViewMode = .always
        delegate = self
        
        updatePlaceholderColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updatePlaceholderColor() {
        if text?.isEmpty ?? true {
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.gray
            ]
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: attributes)
        } else {
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.black
            ]
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: attributes)
        }
    }
    public func updatePlaceholderTextWith(_ newText: String) {
        placeholder = newText
    }
}

extension Goverment_TextField: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updatePlaceholderColor()
    }
}

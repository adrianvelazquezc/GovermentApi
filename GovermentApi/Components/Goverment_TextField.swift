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
        layer.borderColor = UIColor.black.cgColor
        self.placeholder = placeholder
        layer.borderWidth = 0.5
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
}

extension Goverment_TextField: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updatePlaceholderColor()
    }
}

//
//  GovermentTableViewCell.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import UIKit

class GovermentTableViewCell: UITableViewCell {

    static let identifier = "GovermentTableViewCell"
    
    public var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public convenience init(){
        self.init()
        }
    
    fileprivate func setupUIElements() {
        self.addSubview(titleLabel)
        self.backgroundColor = .white
    }
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

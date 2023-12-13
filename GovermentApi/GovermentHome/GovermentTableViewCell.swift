//
//  GovermentTableViewCell.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import UIKit

class GovermentTableViewCell: UITableViewCell {
    
    static let identifier = "GovermentTableViewCell"
    
    public var idLabelTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Id: "
        return label
    }()
    
    public var idLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    public var organizationTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Slug: "
        return label
    }()
    
    public var organizationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    public var urlLabelTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Url: "
        return label
    }()
    
    public var urlLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
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
        backgroundColor = .white
        addSubview(idLabelTitle)
        addSubview(idLabel)
        addSubview(organizationTitle)
        addSubview(organizationLabel)
        addSubview(urlLabelTitle)
        addSubview(urlLabel)
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            idLabelTitle.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            idLabelTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            idLabelTitle.widthAnchor.constraint(equalToConstant: 40),
            idLabel.topAnchor.constraint(equalTo: idLabelTitle.topAnchor),
            idLabel.leadingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor, constant: 5),
            idLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            
            organizationTitle.topAnchor.constraint(equalTo: idLabelTitle.bottomAnchor, constant: 5),
            organizationTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            organizationTitle.widthAnchor.constraint(equalToConstant: 40),
            organizationLabel.topAnchor.constraint(equalTo: organizationTitle.topAnchor),
            organizationLabel.leadingAnchor.constraint(equalTo: organizationTitle.trailingAnchor, constant: 5),
            organizationLabel.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor),
            
            urlLabelTitle.topAnchor.constraint(equalTo: organizationTitle.bottomAnchor, constant: 5),
            urlLabelTitle.leadingAnchor.constraint(equalTo: organizationTitle.leadingAnchor),
            urlLabelTitle.widthAnchor.constraint(equalToConstant: 40),
            urlLabel.topAnchor.constraint(equalTo: urlLabelTitle.topAnchor),
            urlLabel.leadingAnchor.constraint(equalTo: urlLabelTitle.trailingAnchor, constant: 5),
            urlLabel.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor),
            urlLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
}

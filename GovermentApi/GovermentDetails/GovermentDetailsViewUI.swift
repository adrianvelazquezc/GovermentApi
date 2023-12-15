//
//  GovermentDetailsViewUI.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

protocol GovermentDetailsViewUIDelegate {
    func notifyShareInfoToWhatsapp(info: String)
}

class GovermentDetailsViewUI: UIView {
    var delegate: GovermentDetailsViewUIDelegate?
    var navigationController: UINavigationController?
    
    lazy private var detailsTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Details"
        title.textColor = .black
        return title
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.tintColor =  #colorLiteral(red: 0.3916504979, green: 0.2293888927, blue: 0.359031111, alpha: 1)
        button.setImage(UIImage(named: "leftArrowIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.arrowTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor.clear
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var idLabelTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Id: "
        title.textColor = .black
        return title
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor =  #colorLiteral(red: 0.3916504979, green: 0.2293888927, blue: 0.359031111, alpha: 1)
        return label
    }()
    
    lazy private var dateInsertLabelTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Date insert: "
        title.textColor = .black
        return title
    }()
    
    private lazy var dateInsertLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor =  #colorLiteral(red: 0.3916504979, green: 0.2293888927, blue: 0.359031111, alpha: 1)
        return label
    }()
    
    lazy private var organizationLabelTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Organization: "
        title.textColor = .black
        return title
    }()
    
    private lazy var organizationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor =  #colorLiteral(red: 0.3916504979, green: 0.2293888927, blue: 0.359031111, alpha: 1)
        return label
    }()
    
    lazy private var factLabelTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Fact: "
        title.textColor = .black
        return title
    }()
    
    private lazy var factLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor =  #colorLiteral(red: 0.3916504979, green: 0.2293888927, blue: 0.359031111, alpha: 1)
        return label
    }()
    
    lazy private var urlLabelTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "URL: "
        title.textColor = .black
        return title
    }()
    
    private lazy var urlLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor =  #colorLiteral(red: 0.3916504979, green: 0.2293888927, blue: 0.359031111, alpha: 1)
        return label
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor =   #colorLiteral(red: 0.2954775095, green: 0.4989314675, blue: 0.4466043711, alpha: 1)
        button.layer.cornerRadius = 25
        return button
    }()
    
    public convenience init(navigation: UINavigationController,
                            delegate: GovermentDetailsViewUIDelegate?,
                            elementDetail: Result){
        self.init()
        self.delegate = delegate
        navigationController = navigation
        
        fillValues(elementDetail: elementDetail)
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
        backgroundColor =  #colorLiteral(red: 0.8861745, green: 0.9654828906, blue: 0.867546916, alpha: 1)
        addSubview(leftButton)
        addSubview(detailsTitle)
        addSubview(scrollView)
        scrollView.addSubview(idLabelTitle)
        scrollView.addSubview(idLabel)
        scrollView.addSubview(dateInsertLabelTitle)
        scrollView.addSubview(dateInsertLabel)
        scrollView.addSubview(organizationLabelTitle)
        scrollView.addSubview(organizationLabel)
        scrollView.addSubview(factLabelTitle)
        scrollView.addSubview(factLabel)
        scrollView.addSubview(urlLabelTitle)
        scrollView.addSubview(urlLabel)
        scrollView.addSubview(shareButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            leftButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            leftButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            leftButton.heightAnchor.constraint(equalToConstant: 20),
            leftButton.widthAnchor.constraint(equalToConstant: 20),
            
            detailsTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailsTitle.centerYAnchor.constraint(equalTo: leftButton.centerYAnchor),
            
            scrollView.topAnchor.constraint(equalTo: leftButton.bottomAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            idLabelTitle.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            idLabelTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            idLabelTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            idLabelTitle.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            idLabel.topAnchor.constraint(equalTo: idLabelTitle.bottomAnchor, constant: 5),
            idLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            idLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            dateInsertLabelTitle.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 20),
            dateInsertLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            dateInsertLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            dateInsertLabel.topAnchor.constraint(equalTo: dateInsertLabelTitle.bottomAnchor, constant: 5),
            dateInsertLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            dateInsertLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            organizationLabelTitle.topAnchor.constraint(equalTo: dateInsertLabel.bottomAnchor, constant: 20),
            organizationLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            organizationLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            organizationLabel.topAnchor.constraint(equalTo: organizationLabelTitle.bottomAnchor, constant: 5),
            organizationLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            organizationLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            factLabelTitle.topAnchor.constraint(equalTo: organizationLabel.bottomAnchor, constant: 20),
            factLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            factLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            factLabel.topAnchor.constraint(equalTo: factLabelTitle.bottomAnchor, constant: 5),
            factLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            factLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            urlLabelTitle.topAnchor.constraint(equalTo: factLabel.bottomAnchor, constant: 20),
            urlLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            urlLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            urlLabel.topAnchor.constraint(equalTo: urlLabelTitle.bottomAnchor, constant: 5),
            urlLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            urlLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            shareButton.topAnchor.constraint(equalTo: urlLabel.bottomAnchor, constant: 20),
            shareButton.widthAnchor.constraint(equalToConstant: 80),
            shareButton.heightAnchor.constraint(equalToConstant: 50),
            shareButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            shareButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
        ])
    }
    
    private func fillValues(elementDetail: Result) {
        idLabel.text = elementDetail.id
        organizationLabel.text = elementDetail.organization
        factLabel.text = elementDetail.fact
        urlLabel.text = elementDetail.url
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            if let date = dateFormatter.date(from: elementDetail.dateInsert) {
                dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
                let formattedDate = dateFormatter.string(from: date)
                dateInsertLabel.text = formattedDate
            } else {
                dateInsertLabel.text = elementDetail.dateInsert
            }
    }
    
    @objc func arrowTapped(_ sender: UIButton){
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    @objc func buttonTapped(_ sender: UITapGestureRecognizer) {
        delegate?.notifyShareInfoToWhatsapp(info: "Id: \(idLabel.text ?? ""),\n Organization: \(organizationLabel.text ?? ""),\n Fact: \(factLabel.text ?? ""),\n Url: \(urlLabel.text ?? ""),\n Date inserted: \(dateInsertLabel.text ?? "").")
    }
}

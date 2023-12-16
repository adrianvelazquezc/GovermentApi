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
    
    var contentView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
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
    
    lazy private var slugLabelTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Slug: "
        title.textColor = .black
        return title
    }()
    
    private lazy var slugLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor =  #colorLiteral(red: 0.3916504979, green: 0.2293888927, blue: 0.359031111, alpha: 1)
        return label
    }()
    
    lazy private var columnsLabelTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Columns: "
        title.textColor = .black
        return title
    }()
    
    private lazy var columnsLabel: UILabel = {
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
    
    lazy private var resourceLabelTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Resource: "
        title.textColor = .black
        return title
    }()
    
    private lazy var resourceLabel: UILabel = {
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
    
    lazy private var operationsLabelTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Operations: "
        title.textColor = .black
        return title
    }()
    
    private lazy var operationsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor =  #colorLiteral(red: 0.3916504979, green: 0.2293888927, blue: 0.359031111, alpha: 1)
        return label
    }()
    
    lazy private var datasetLabelTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Dataset: "
        title.textColor = .black
        return title
    }()
    
    private lazy var datasetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor =  #colorLiteral(red: 0.3916504979, green: 0.2293888927, blue: 0.359031111, alpha: 1)
        return label
    }()
    
    lazy private var createdAtLabelTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "CreatedAt: "
        title.textColor = .black
        return title
    }()
    
    private lazy var createdAtLabel: UILabel = {
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
        addSubview(contentView)
        contentView.addSubview(idLabelTitle)
        contentView.addSubview(idLabel)
        contentView.addSubview(dateInsertLabelTitle)
        contentView.addSubview(dateInsertLabel)
        contentView.addSubview(slugLabelTitle)
        contentView.addSubview(slugLabel)
        contentView.addSubview(columnsLabelTitle)
        contentView.addSubview(columnsLabel)
        contentView.addSubview(factLabelTitle)
        contentView.addSubview(factLabel)
        contentView.addSubview(organizationLabelTitle)
        contentView.addSubview(organizationLabel)
        contentView.addSubview(resourceLabelTitle)
        contentView.addSubview(resourceLabel)
        contentView.addSubview(urlLabelTitle)
        contentView.addSubview(urlLabel)
        contentView.addSubview(operationsLabelTitle)
        contentView.addSubview(operationsLabel)
        contentView.addSubview(datasetLabelTitle)
        contentView.addSubview(datasetLabel)
        contentView.addSubview(createdAtLabelTitle)
        contentView.addSubview(createdAtLabel)
        contentView.addSubview(shareButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            leftButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            leftButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            leftButton.heightAnchor.constraint(equalToConstant: 20),
            leftButton.widthAnchor.constraint(equalToConstant: 20),
            
            detailsTitle.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailsTitle.centerYAnchor.constraint(equalTo: leftButton.centerYAnchor),
            
            
            contentView.topAnchor.constraint(equalTo: leftButton.bottomAnchor, constant: 10),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: widthAnchor),
            
            idLabelTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            idLabelTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            idLabelTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            idLabelTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            idLabel.topAnchor.constraint(equalTo: idLabelTitle.bottomAnchor, constant: 5),
            idLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            idLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            dateInsertLabelTitle.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 20),
            dateInsertLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            dateInsertLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            dateInsertLabel.topAnchor.constraint(equalTo: dateInsertLabelTitle.bottomAnchor, constant: 5),
            dateInsertLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            dateInsertLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            slugLabelTitle.topAnchor.constraint(equalTo: dateInsertLabel.bottomAnchor, constant: 20),
            slugLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            slugLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            slugLabel.topAnchor.constraint(equalTo: slugLabelTitle.bottomAnchor, constant: 5),
            slugLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            slugLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            
            columnsLabelTitle.topAnchor.constraint(equalTo: slugLabel.bottomAnchor, constant: 20),
            columnsLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            columnsLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            columnsLabel.topAnchor.constraint(equalTo: columnsLabelTitle.bottomAnchor, constant: 5),
            columnsLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            columnsLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            factLabelTitle.topAnchor.constraint(equalTo: columnsLabel.bottomAnchor, constant: 20),
            factLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            factLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            factLabel.topAnchor.constraint(equalTo: factLabelTitle.bottomAnchor, constant: 5),
            factLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            factLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            organizationLabelTitle.topAnchor.constraint(equalTo: factLabel.bottomAnchor, constant: 20),
            organizationLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            organizationLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            organizationLabel.topAnchor.constraint(equalTo: organizationLabelTitle.bottomAnchor, constant: 5),
            organizationLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            organizationLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            resourceLabelTitle.topAnchor.constraint(equalTo: organizationLabel.bottomAnchor, constant: 20),
            resourceLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            resourceLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            resourceLabel.topAnchor.constraint(equalTo: resourceLabelTitle.bottomAnchor, constant: 5),
            resourceLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            resourceLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            urlLabelTitle.topAnchor.constraint(equalTo: resourceLabel.bottomAnchor, constant: 20),
            urlLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            urlLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            urlLabel.topAnchor.constraint(equalTo: urlLabelTitle.bottomAnchor, constant: 5),
            urlLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            urlLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            operationsLabelTitle.topAnchor.constraint(equalTo: urlLabel.bottomAnchor, constant: 20),
            operationsLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            operationsLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            operationsLabel.topAnchor.constraint(equalTo: operationsLabelTitle.bottomAnchor, constant: 5),
            operationsLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            operationsLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            datasetLabelTitle.topAnchor.constraint(equalTo: operationsLabel.bottomAnchor, constant: 20),
            datasetLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            datasetLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            datasetLabel.topAnchor.constraint(equalTo: datasetLabelTitle.bottomAnchor, constant: 5),
            datasetLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            datasetLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            createdAtLabelTitle.topAnchor.constraint(equalTo: datasetLabel.bottomAnchor, constant: 20),
            createdAtLabelTitle.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            createdAtLabelTitle.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            createdAtLabel.topAnchor.constraint(equalTo: createdAtLabelTitle.bottomAnchor, constant: 5),
            createdAtLabel.leadingAnchor.constraint(equalTo: idLabelTitle.leadingAnchor),
            createdAtLabel.trailingAnchor.constraint(equalTo: idLabelTitle.trailingAnchor),
            
            shareButton.topAnchor.constraint(equalTo: createdAtLabel.bottomAnchor, constant: 20),
            shareButton.widthAnchor.constraint(equalToConstant: 80),
            shareButton.heightAnchor.constraint(equalToConstant: 50),
            shareButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            shareButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
    private func fillValues(elementDetail: Result) {
        idLabel.text = elementDetail.id
        organizationLabel.text = elementDetail.organization
        factLabel.text = elementDetail.fact
        urlLabel.text = elementDetail.url
        slugLabel.text = elementDetail.slug
        columnsLabel.text = elementDetail.columns
        resourceLabel.text = elementDetail.resource
        operationsLabel.text = elementDetail.operations
        datasetLabel.text = elementDetail.dataset
        createdAtLabel.text = "\(elementDetail.createdAt)"
        
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
    
    @objc func buttonTapped(_ sender: UIButton) {
        let id = idLabel.text ?? ""
        let organization = organizationLabel.text ?? ""
        let fact = factLabel.text ?? ""
        let url = urlLabel.text ?? ""
        let dateInserted = dateInsertLabel.text ?? ""
        let slug = slugLabel.text ?? ""
        let columns = columnsLabel.text ?? ""
        let resource = resourceLabel.text ?? ""
        let operations = operationsLabel.text ?? ""
        let dataset = datasetLabel.text ?? ""
        let createdAt = createdAtLabel.text ?? ""
        
        let message = """
        Id: \(id),
        Organization: \(organization),
        Fact: \(fact),
        Url: \(url),
        Date inserted: \(dateInserted),
        Slug: \(slug),
        Columns: \(columns),
        Resource: \(resource),
        Operations: \(operations),
        Dataset: \(dataset),
        CreatedAt: \(createdAt).
        """
        
        delegate?.notifyShareInfoToWhatsapp(info: message)
    }
}

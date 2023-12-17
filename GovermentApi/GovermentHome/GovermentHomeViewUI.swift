//
//  GovermentHomeViewUI.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

protocol GovermentHomeViewUIDelegate {
    func notifyGetFilterString(filter: String)
    func addNewValues()
    func notifyShowInfo(element: Result)
}

class GovermentHomeViewUI: UIView {
    var delegate: GovermentHomeViewUIDelegate?
    var navigationController: UINavigationController?
    internal var originalElementList: [Result] = []
    lazy var elementList: [Result] = originalElementList
    var isSendingRequest = false
    public var currentSearch: CurrentSearch = .id
    
    lazy var searchBar: Goverment_TextField = {
        let textField = Goverment_TextField(placeholder: "Insert id to track")
        textField.addTarget(self, action: #selector(searchInfo), for: .editingChanged)
        return textField
    }()
    
    lazy var dropdownButton: Goverment_DropdownView = {
        let button = Goverment_DropdownView(incomingElementName: ["id", "organization", "urlLabel"], parent: self)
        button.delegate = self
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(GovermentTableViewCell.self, forCellReuseIdentifier: GovermentTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor =  #colorLiteral(red: 0.8861745, green: 0.9654828906, blue: 0.867546916, alpha: 1)
        tableView.indicatorStyle = .black
        return tableView
    }()
    
    public convenience init(navigation: UINavigationController, delegate: GovermentHomeViewUIDelegate?, responseData: [Result]) {
        self.init()
        self.delegate = delegate
        self.navigationController = navigation
        self.originalElementList = responseData
        
        searchInfo()
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
        addSubview(searchBar)
        addSubview(tableView)
        addSubview(dropdownButton)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            dropdownButton.topAnchor.constraint(equalTo: searchBar.topAnchor),
            dropdownButton.bottomAnchor.constraint(equalTo: searchBar.bottomAnchor),
            dropdownButton.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor),
            dropdownButton.widthAnchor.constraint(equalToConstant: 100),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        dropdownButton.setUi(reference: dropdownButton)
    }
    
    @objc func dissmisKeyboard(_ sender: UITapGestureRecognizer){
        self.endEditing(true)
    }
    
    @objc func searchInfo() {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchInfoWithDelay), object: nil)
        self.perform(#selector(searchInfoWithDelay), with: nil, afterDelay: 0.5)
    }
    
    @objc func searchInfoWithDelay() {
        delegate?.notifyGetFilterString(filter: searchBar.text ?? "")
    }
    
    func addNewItemsFrom(list: [Result]) {
        originalElementList += list
        elementList = originalElementList
        tableView.reloadData()
        isSendingRequest = false
    }
}

extension GovermentHomeViewUI: UITableViewDelegate,  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GovermentTableViewCell", for: indexPath) as! GovermentTableViewCell
        cell.backgroundColor =  #colorLiteral(red: 0.8861745, green: 0.9654828906, blue: 0.867546916, alpha: 1)
        cell.idLabel.text = elementList[indexPath.row].id
        cell.organizationLabel.text = elementList[indexPath.row].organization
        cell.urlLabel.text = "\(elementList[indexPath.row].url)"
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset

        if distanceFromBottom - 100 < height && !isSendingRequest {
            isSendingRequest = true
            delegate?.addNewValues()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.notifyShowInfo(element: elementList[indexPath.row])
    }
}
extension GovermentHomeViewUI: Goverment_DropdownViewProtocol {
    func didChoiceFilter(_ elementToFilter: String) {
        searchBar.updatePlaceholderTextWith("Insert \(elementToFilter) to track")
        currentSearch = CurrentSearch(rawValue: elementToFilter) ?? .id
    }
}

//
//  GovermentHomeViewUI.swift
//  GovermentApi
//
//  Created by Mac on 12/12/23.
//

import UIKit

protocol GovermentHomeViewUIDelegate {
    func getFilterString(filter: String)
}

class GovermentHomeViewUI: UIView {
    var delegate: GovermentHomeViewUIDelegate?
    var navigationController: UINavigationController?
    internal var originalElementList: [Result]?
    lazy var elementList: [Result] = originalElementList ?? [Result]()
    
    lazy var searchBar: Goverment_TextField = {
        let textField = Goverment_TextField(placeholder: "Insert id to track")
        textField.addTarget(self, action: #selector(searchInfo), for: .editingChanged)
        return textField
    }()
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(GovermentTableViewCell.self, forCellReuseIdentifier: GovermentTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        return tableView
    }()
    
    public convenience init(navigation: UINavigationController, delegate: GovermentHomeViewUIDelegate, responseData: Response) {
        self.init()
        self.delegate = delegate
        self.navigationController = navigation
        self.originalElementList = responseData.results
        
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
        backgroundColor = .white
        self.addSubview(searchBar)
        self.addSubview(tableView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    @objc func dissmisKeyboard(_ sender: UITapGestureRecognizer){
        self.endEditing(true)
    }
    
    @objc func searchInfo(){
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(searchInfoWithDelay), object: nil)
        self.perform(#selector(searchInfoWithDelay), with: nil, afterDelay: 0.5)
    }
    
    @objc func searchInfoWithDelay() {
        delegate?.getFilterString(filter: searchBar.text ?? "")
    }
}

extension GovermentHomeViewUI: UITableViewDelegate,  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        elementList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GovermentTableViewCell", for: indexPath) as! GovermentTableViewCell
        cell.titleLabel.text = elementList[indexPath.row].id
        return cell
    }
}

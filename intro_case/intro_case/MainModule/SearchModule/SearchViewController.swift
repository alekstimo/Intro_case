//
//  SearchViewController.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 25.03.2023.
//

import UIKit

class SearchViewController: UIViewController {

    
    private var searchTips = ["Adidas Yeezy","Sony Plastation","Nike Air","Puma","BMW X6","Jack Daniels","New Balance","Reebok Classic","Rolex"]
    private var filtred: [String] = []
   
    
    @IBOutlet weak var tipsTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       // configureModel()
        configureAppearance()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipsTableView.reloadData()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        preferredContentSize = CGSize(width: 250, height: tipsTableView.contentSize.height)
    }
    
    func editText(text: String) -> Bool {
        filtred = []
        var flag = false
        //searchingText = text
        if text != "" && text != " " {
            for item in searchTips {
                if item.lowercased().contains(text.lowercased()) {
                    flag = true
                    filtred.append(item)
                }
            }
        }
        return flag
       // tipsTableView.reloadData()
    }
    
    func configureAppearance() {
        configureTableView()
    }
    
    func configureTableView() {
        
        tipsTableView.translatesAutoresizingMaskIntoConstraints = false

        tipsTableView.register(UINib(nibName: "\(SearchTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(SearchTableViewCell.self)")
        tipsTableView.dataSource = self
        tipsTableView.delegate = self
        tipsTableView.rowHeight = 44
       
    }

}

// MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtred.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(SearchTableViewCell.self)")
            if let cell = cell as? SearchTableViewCell {
                cell.text = filtred[indexPath.row]
            }
            return cell ?? UITableViewCell()
        
    }
   
}


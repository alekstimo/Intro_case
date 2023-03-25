//
//  MainViewController.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import UIKit
var isPresent = false
struct Category {
    var title: String
    var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}


class MainViewController: UIViewController {

    var popVCSearchTips = SearchViewController()
    var coordinator: HomeFlow?
    
    let categoryArray = [Category(title: "Phones", imageName: "PhonesImage"),Category(title: "Headphones", imageName: "HeadphonesImage"),Category(title: "Games", imageName: "GamesImage"),Category(title: "Cars", imageName: "CarsImage"),Category(title: "Furniture", imageName: "FurnitureImage"),Category(title: "kids", imageName: "KidsImage")]
    
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet var titleView: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureCollectionView()
        configureTableView()
    
    }
    private func configureNavigationBar() {
      
        let leftMenu = UIBarButtonItem(image: resizeImage( image: UIImage(named: "menuMainPage")!, targetSize: CGSize(width: 22, height: 24)),
                                       style: .plain,
                                       target: self,
                                        action: #selector(self.menuButtonTapped))
        navigationItem.leftBarButtonItem = leftMenu
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        
        searchBar.sizeToFit()
        customSearchBar()

       // titleView.frame.size = CGSize(width: 200, height: 25)
        titleView.sizeToFit()
//        navigationItem.accessibilityFrame.size = CGSize(width: navigationItem.accessibilityFrame.width, height: rightNavigationItemView.frame.height)
        navigationItem.titleView = titleView
       // navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightNavigationItemView)
    }
    @objc func menuButtonTapped(){
       // print("menuButtonTapped")
       
    }
    
    
    //MARK: SearchBar events
    @IBAction func searchBarEditindDidEnd(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){ [self] in
            if popVCSearchTips.editText(text: searchBar.text ?? "") {
                popVCSearchTips.modalPresentationStyle = .popover
                let popOverVc = popVCSearchTips.popoverPresentationController
                popOverVc?.delegate = self
                popOverVc?.sourceView = self.searchBar
                popOverVc?.sourceRect = CGRect(x: self.searchBar.bounds.midX , y: self.searchBar.bounds.maxY, width: 0, height: 0)
                popVCSearchTips.preferredContentSize = CGSize(width: 250, height: 100)
                
                self.present(popVCSearchTips, animated: true)
            }
        }
       
    }
   
    
    private func customSearchBar(){
       
        searchBar.layer.cornerRadius = 15
        searchBar.textColor = .black
        searchBar.tintColor = #colorLiteral(red: 0.3568627451, green: 0.3568627451, blue: 0.3568627451, alpha: 1)
        searchBar.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.968627451, alpha: 1)
        
        searchBar.layer.masksToBounds = true
        searchBar.returnKeyType = .search
        searchBar.borderStyle = .none
        
        searchBar.attributedPlaceholder = NSAttributedString(
            string: "What are you looking for?",
            attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.3568627451, green: 0.3568627451, blue: 0.3568627451, alpha: 1) ]
        )
        
         
    }
    func configureCollectionView() {
        categoryCollectionView.register(UINib(nibName: "\(CategoryCollectionViewCell.self)", bundle: .main),
                                forCellWithReuseIdentifier: "\(CategoryCollectionViewCell.self)")
        categoryCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        categoryCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.showsVerticalScrollIndicator = false
        categoryCollectionView.contentInset = .init(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    func configureTableView() {
        tableView.backgroundColor = UIColor(named: "backgroundColor")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(UINib(nibName: "\(LatestTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(LatestTableViewCell.self)")
        tableView.register(UINib(nibName: "\(FlashSaleTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(FlashSaleTableViewCell.self)")
        //tableView.rowHeight = 65
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        //tableView.rowHeight = 400
        //tableView.rowHeight = UITableView.automaticDimension
    }

}
// MARK: - UIPopOver
extension MainViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

// MARK: - UICollection
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CategoryCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? CategoryCollectionViewCell {
            cell.title = categoryArray[indexPath.row].title
            cell.categoryImage = UIImage(named: categoryArray[indexPath.row].imageName)!
            }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
    
        return CGSize(width: CGFloat(50), height: CGFloat(70))
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return CGFloat(5)
        
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return Constants.spaceBetweenElements
//
//    }
    

}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(LatestTableViewCell.self)")
            if let cell = cell as? LatestTableViewCell {
               
                cell.title = "Latest"

            }
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(FlashSaleTableViewCell.self)")
            if let cell = cell as? FlashSaleTableViewCell {
               
                cell.title = "Flash Sale"
               
            }
            return cell ?? UITableViewCell()
        
        default:
            return UITableViewCell()
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard indexPath.row == 6 else { return }
//        currentUser = " "
//        coordinator?.coordinateToSignIn()
//    }

}


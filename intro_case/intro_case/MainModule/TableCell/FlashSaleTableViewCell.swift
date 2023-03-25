//
//  FlashSaleTableViewCell.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 22.03.2023.
//

import UIKit

class FlashSaleTableViewCell: UITableViewCell {

    private let model: FlashSaleModel = .init()
   // private let allType: [TypeCollection] = [.latest, .flashSale]
    @IBOutlet weak var divisionTatleLabel: UILabel!
    @IBOutlet weak var divisionCollectionView: UICollectionView!
    //let latesCollectionVC = LatesCollectionViewController()
    var title: String = "" {
        didSet {
            divisionTatleLabel.text = title
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureApperance()
    }
    func configureApperance() {
        
        selectionStyle = .none
        divisionCollectionView.register(UINib(nibName: "\(FlashSaleCollectionViewCell.self)", bundle: .main),
                                        forCellWithReuseIdentifier: "\(FlashSaleCollectionViewCell.self)")
        divisionCollectionView.translatesAutoresizingMaskIntoConstraints = false
        divisionCollectionView.showsHorizontalScrollIndicator = false
        divisionCollectionView.showsVerticalScrollIndicator = false
        divisionCollectionView.delegate = self
        divisionCollectionView.dataSource = self
        divisionCollectionView.contentInset = .init(top: 0, left: 11, bottom: 0, right: 0)
        
        configureModel()
        model.loadPosts()
        
        
        //divisionCollectionView.reloadData()
        
    }
    
    
    
   
}
private extension FlashSaleTableViewCell {
    func configureModel() {
        model.didItemsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.divisionCollectionView.reloadData()
            }
        }
    }
}

// MARK: UICollectionViewDataSource
extension FlashSaleTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return model.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(FlashSaleCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? FlashSaleCollectionViewCell {
            let item = model.items[indexPath.row]
            cell.title = item.name
            cell.price = item.price
            cell.imageUrlInString = item.imageUrlInString
            cell.category = item.category
            cell.discount = item.discount
            }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return CGSize(width: 174, height: 221)
       
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//
//        return 9
//
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9

    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        NotificationCenter.default.post(name: NSNotification.Name("toDetail"), object: Any?.self)
//    }

}

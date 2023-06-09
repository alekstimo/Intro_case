//
//  LatestTableViewCell.swift
//  intro_case
//
//
//

import UIKit

class LatestTableViewCell: UITableViewCell {

    private let model: latestModel = .init()
   
    //MARK: - UIView
    @IBOutlet weak var divisionTatleLabel: UILabel!
    @IBOutlet weak var divisionCollectionView: UICollectionView!
    
    //MARK: - Property
    var title: String = "" {
        didSet {
            divisionTatleLabel.text = title
            
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureApperance()
    }
    
    //MARK: - Configuration
    func configureApperance() {
        
        selectionStyle = .none
        
        divisionCollectionView.register(UINib(nibName: "\(CollectionViewCell.self)", bundle: .main),
                                        forCellWithReuseIdentifier: "\(CollectionViewCell.self)")
        
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
private extension LatestTableViewCell {
    func configureModel() {
        model.didItemsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.divisionCollectionView.reloadData()
            }
        }
    }
}

// MARK: UICollectionViewDataSource
extension LatestTableViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return model.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCell.self)", for: indexPath)
        if let cell = cell as? CollectionViewCell {
            let item = model.items[indexPath.row]
            cell.title = item.name
            cell.price = item.price
            cell.imageUrlInString = item.imageUrlInString
            cell.category = item.categoty
            }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 114, height: 149)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    


}


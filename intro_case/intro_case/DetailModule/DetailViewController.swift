//
//  DetailViewController.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 25.03.2023.
//

import UIKit

class DetailViewController: UIViewController {

    
    
    //MARK: - UIView
    @IBOutlet weak var totalView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var discriptionLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var numberViewsLabel: UILabel!
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var colorButton1: UIButton!
    @IBOutlet private weak var colorButton2: UIButton!
    @IBOutlet private weak var colorButton3: UIButton! //ЦВЕТОВ МОЖЕТ БЫТЬ МНОГО! переделать?
    @IBOutlet private weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    //MARK: - Property
    var coordinator: DetailCoordinator?
    var slectedIndexPath = IndexPath(indexes: [0,1])
    var count = 1
    var model: detailModel = .init()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        model.loadPosts()
        configure()
    }

    //MARK: - Color buttons events
    @IBAction func colorButtonTouched(_ sender: UIButton) {
        colorButton1.layer.borderWidth = 0
        colorButton2.layer.borderWidth = 0
        colorButton3.layer.borderWidth = 0
        sender.layer.borderWidth = 2
        
    }
    
    //MARK: - Change count buttons events
    @IBAction func priceChange(_ sender: UIButton) {
        
            switch sender.tag {
            case 4:
                if count > 1 {
                    count -= 1
                }
                break
            case 5:
                count += 1
                break
                
            default:
                break
            }
        addToCartButton.setTitle("$ \(formatter(price: model.item.price * Double(count)))   ADD TO CART", for: .normal)
    }
    
}

//MARK: - Private 
private extension DetailViewController {
    
    
    func configure() {
        
        titleLabel.text = model.item.name
        priceLabel.text = "$ \(formatter(price: model.item.price))"
        
        discriptionLabel.text = model.item.description
        
        ratingLabel.text = model.item.rating
        numberViewsLabel.text = "(\(model.item.number_of_reviews) rewies)"
        
        if (model.item.colors.count == 3){
            colorButton1.backgroundColor = UIColor(hex: model.item.colors[0])
            colorButton1.layer.borderWidth = 2
        
            colorButton2.backgroundColor = UIColor(hex: model.item.colors[1])
            colorButton3.backgroundColor = UIColor(hex: model.item.colors[2])
        }
        colorButton1.layer.cornerRadius = 8
        colorButton2.layer.cornerRadius = 8
        colorButton3.layer.cornerRadius = 8
        let url = URL(string: model.item.image_urls[0])!
        productImageView.loadImage(from: url)
        productImageView.layer.cornerRadius = 10
        productImageView?.contentMode = .scaleAspectFill
        
        
        
        photoCollectionView.register(UINib(nibName: "\(ImageCollectionViewCell.self)", bundle: .main),
                                        forCellWithReuseIdentifier: "\(ImageCollectionViewCell.self)")
        
        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        photoCollectionView.showsHorizontalScrollIndicator = false
        photoCollectionView.showsVerticalScrollIndicator = false
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        
        
        let backButton = UIBarButtonItem(image: resizeImage(image: resizeImage(image:UIImage(named: "backArrow2")!,targetSize: CGSize(width: 12, height: 12) ) , targetSize: CGSize.init(width: 12, height: 12)),
                                         style: .plain,
                                         target: navigationController,
                                         action: #selector(UINavigationController.popViewController(animated:)))
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        totalView.layer.cornerRadius = 20
        plusButton.layer.cornerRadius = 8
        minusButton.layer.cornerRadius = 8
        addToCartButton.layer.cornerRadius = 15
        addToCartButton.setTitle("$ \(formatter(price: model.item.price))   ADD TO CART", for: .normal)
        
    }
    
}

// MARK: UICollectionViewDataSource
extension DetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.item.image_urls.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ImageCollectionViewCell.self)", for: indexPath)
        if let cell = cell as? ImageCollectionViewCell {
            cell.imageUrlInString = model.item.image_urls[indexPath.row]
            }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath == slectedIndexPath {
            return CGSize(width: 83, height: 45)
        }
        return CGSize(width: 65, height: 37)
       
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4.5

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let url = URL(string: model.item.image_urls[indexPath.row])!
        productImageView.loadImage(from: url)
        slectedIndexPath = indexPath
        collectionView.reloadData()
    }

}


extension UIColor {
    convenience init?(hex: String) {
        var hexSanitaizer = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitaizer = hexSanitaizer.replacingOccurrences(of: "#", with: "")
        let lenght = hexSanitaizer.count
        
        var rgb: UInt64 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        guard Scanner(string: hexSanitaizer).scanHexInt64(&rgb) else {
            return nil
        }
        
        if lenght == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        } else if lenght == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
            
        } else { return nil }
        
        self.init(red: r, green: g, blue: b, alpha: a)
        
    }
}
private func formatter(price: Double) -> String {
    let nPrice = NSNumber(floatLiteral: price)
    let formatter = NumberFormatter()
    formatter.maximumFractionDigits = 2
    formatter.decimalSeparator = ","
    formatter.groupingSeparator = ""
    formatter.numberStyle = .decimal
    return formatter.string(from: nPrice)!
}

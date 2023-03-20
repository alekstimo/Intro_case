//
//  ProfileTableViewCell.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 20.03.2023.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    
    //MARK: - UIView
    @IBOutlet private weak var cellImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var elementLabel: UILabel!
    
    
    //MARK: - Properties
    var title: String = "" {
        didSet{
            titleLabel.text = title
        }
    }
    
    var element: String = "" {
        didSet {
            if element == ">" {
                elementLabel.font = .boldSystemFont(ofSize: 17) //TODO: - Картинка вместо знака
            }
            elementLabel.text = element
        }
    }
    
    var leftImage: UIImage = UIImage(named: "ProfileImage1")!{
        didSet {
            cellImageView.image = leftImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        self.backgroundColor = UIColor(named: "backgroundColor")
    }
    
   
    
}

//
//  SearchTableViewCell.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 25.03.2023.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    //MARK: - UIView
    @IBOutlet weak var titleLabel: UILabel!
  
    var text: String = "" {
        didSet {
            titleLabel.text = text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureApperance()
    }

    //MARK: - Configuration
    private func configureApperance() {
      //  selectionStyle = .none
        titleLabel.textColor = .black
    }
}

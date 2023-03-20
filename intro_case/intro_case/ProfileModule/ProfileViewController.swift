//
//  ProfileViewController.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 17.03.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    var coordinator: ProfileFlow?
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func changePhotoButtonTouched(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureAppearance()
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
private extension ProfileViewController {
    func configureAppearance() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        nameLabel.text = currentUser
        configureTableView()
        uploadButton.layer.cornerRadius = 15
    }
    func configureNavigationBar() {
        navigationItem.title = "Profile"
        let leftArroy = UIBarButtonItem(image:resizeImage(image: UIImage(named: "backArrow")!, targetSize: CGSize.init(width: 25, height: 25)),
                                         style: .plain, target: self,
                                        action: .none)
        navigationItem.leftBarButtonItem = leftArroy
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    func configureTableView() {
        tableView.backgroundColor = UIColor(named: "backgroundColor")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(UINib(nibName: "\(ProfileTableViewCell.self)", bundle: .main),
                           forCellReuseIdentifier: "\(ProfileTableViewCell.self)")
        tableView.rowHeight = 65
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
}

// MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileTableViewCell.self)")
            if let cell = cell as? ProfileTableViewCell {
                cell.leftImage = UIImage(named: "ProfileImage1")!
                cell.title = "Trade store"
                cell.element = ">"
            }
            return cell ?? UITableViewCell()
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileTableViewCell.self)")
            if let cell = cell as? ProfileTableViewCell {
                cell.leftImage = UIImage(named: "ProfileImage1")!
                cell.title = "Payment method"
                cell.element = ">"
            }
            return cell ?? UITableViewCell()
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileTableViewCell.self)")
            if let cell = cell as? ProfileTableViewCell {
                cell.leftImage = UIImage(named: "ProfileImage1")!
                cell.title = "Balance"
                cell.element = "$ 1593"
            }
            return cell ?? UITableViewCell()
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileTableViewCell.self)")
            if let cell = cell as? ProfileTableViewCell {
                cell.leftImage = UIImage(named: "ProfileImage1")!
                cell.title = "Trade history"
                cell.element = ">"
            }
            return cell ?? UITableViewCell()
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileTableViewCell.self)")
            if let cell = cell as? ProfileTableViewCell {
                cell.leftImage = UIImage(named: "RefreshProfileImage")!
                cell.title = "Restore Purchase"
                cell.element = ">"
            }
            return cell ?? UITableViewCell()
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileTableViewCell.self)")
            if let cell = cell as? ProfileTableViewCell {
                cell.leftImage = UIImage(named: "helpProfileImage")!
                cell.title = "Help"
                cell.element = " "
            }
            return cell ?? UITableViewCell()
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileTableViewCell.self)")
            if let cell = cell as? ProfileTableViewCell {
                cell.leftImage = UIImage(named: "LogOutProfileImage")!
                cell.title = "Log out"
                cell.element = " "
            }
            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row == 6 else { return }
        currentUser = " "
        coordinator?.coordinateToSignIn()
    }

}


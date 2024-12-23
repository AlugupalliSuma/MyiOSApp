//
//  UserDetailViewController.swift
//  MVVMexample
//
//  Created by Suma on 23/12/24.
//

import UIKit

class UserDetailsViewController: UIViewController {
    let user: User
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        view.backgroundColor = .white
        let nameLabel = UILabel()
        nameLabel.text = "Name: \(user.name)"
        nameLabel.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 30)
        
        let emailLabel = UILabel()
        emailLabel.text = "Email: \(user.email)"
        emailLabel.frame = CGRect(x: 20, y: 140, width: view.frame.width - 40, height: 30)
        
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
    }
    
}

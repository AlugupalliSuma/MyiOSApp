//
//  ViewController.swift
//  MVVMexample
//
//  Created by Suma on 23/12/24.
//

import UIKit

class UserListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let viewModel = UserViewModel()
    @IBOutlet weak var customNavBar: CustomNavigationView!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavBar.configure("User List")
        customNavBar.leftButton.isHidden = true
        tableView.register(UINib(nibName: "UserListTableViewCell", bundle: nil), forCellReuseIdentifier: "UserListTableViewCell")
        viewModel.fetchUsers { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell", for: indexPath) as? UserListTableViewCell{
            let user = viewModel.users[indexPath.row]
            cell.name?.text = user.name
            cell.userName?.text = user.username
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 71
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.users[indexPath.row]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let detailsVc = storyBoard.instantiateViewController(withIdentifier: "UserDetailsViewController") as? UserDetailsViewController{
            detailsVc.user = user
            self.navigationController?.pushViewController(detailsVc, animated: true)
        }
    }
}

//
//  ViewController.swift
//  MVVMexample
//
//  Created by Suma on 23/12/24.
//

import UIKit

class UserListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    let viewModel = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.fetchUsers { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        let user = viewModel.users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.username
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.users[indexPath.row]
        let detailsVC = UserDetailsViewController(user: user)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

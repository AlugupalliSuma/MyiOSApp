//
//  UserViewModel.swift
//  MVVMexample
//
//  Created by Suma on 23/12/24.
//

import Foundation
class UserViewModel {
    var users: [User] = []
    let apiService = APIService()

    func fetchUsers(completion: @escaping () -> Void) {
        apiService.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
                completion()
            case .failure(let error):
                print("Error fetching users: \(error)")
            }
        }
    }
}

//
//  NetworkManager.swift
//  MVVMexample
//
//  Created by Suma on 23/12/24.
//

import Foundation
class APIService {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

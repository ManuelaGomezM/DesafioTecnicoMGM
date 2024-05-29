//
//  UserService.swift
//  DesafioTecnico
//
//  Created by Manuela on 29/05/2024.
//

import Foundation

final class UserService {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
            guard let usersUrl = URL(string: "https://jsonplaceholder.org/users") else {
                completion(.failure(NetworkingUsersError.usersURLNotFound))
                return
            }
            URLSession.shared.dataTask(with: usersUrl) { data, response, error in
                guard let data = data, error == nil else {
                    completion(.failure(NetworkingUsersError.userNilData))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let users = try decoder.decode([User].self, from: data)
                    completion(.success(users))
                } catch {
                    completion(.failure(error))
                    print("Error decoding JSON: \(error)")
                }
            }.resume()
        }
}

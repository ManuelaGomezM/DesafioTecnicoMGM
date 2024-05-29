//
//  HomeViewModel.swift
//  ChallengeTecnico1
//
//  Created by Manuela on 28/05/2024.
//

import Foundation
import Combine
import CoreLocation

final public class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    private let userService: UserService
    
    init(userService: UserService = UserService()) {
        self.userService = userService
        loadUsers()
    }
    
    
    func loadUsers() {
        userService.getUsers { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedUsers):
                    self?.users = fetchedUsers
                case .failure(let error):
                    print("Failed to fetch users: \(error)")
                }
            }
        }
    }
}

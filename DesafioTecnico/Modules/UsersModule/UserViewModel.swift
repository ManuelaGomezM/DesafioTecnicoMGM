//
//  HomeViewModel.swift
//  ChallengeTecnico1
//
//  Created by Manuela on 28/05/2024.
//

import Foundation
import Combine
import CoreLocation


final public class HomeViewModel: ObservableObject {
    @Published var users: [User] = []

    init() {
        loadUsers()
    }

    func loadUsers() {
        users = [
            User(userName: "User 1", location: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)),
            User(userName: "User 2", location: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437)),
        ]
    }
}

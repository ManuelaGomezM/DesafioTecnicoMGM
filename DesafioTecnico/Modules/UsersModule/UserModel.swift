//
//  HomeModel.swift
//  ChallengeTecnico1
//
//  Created by Manuela on 28/05/2024.
//

import Foundation
import CoreLocation

struct User: Codable {
    let id: Int
    let firstname: String
    let lastname: String
    let email: String
    let birthDate: String
    let login: Login
    let address: Address
    let phone: String
    let website: String
    let company: Company
}

struct Login: Codable {
    let uuid: String
    let username: String
    let password: String
    let md5: String
    let sha1: String
    let registered: String
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: Geo
}

struct Geo: Codable {
    let lat: String
    let lng: String
}

struct Company: Codable {
    let name: String
    let catchPhrase: String
    let bs: String
}

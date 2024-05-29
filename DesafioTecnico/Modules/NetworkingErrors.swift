//
//  NetworkingErrors.swift
//  DesafioTecnico
//
//  Created by Manuela on 29/05/2024.
//

import Foundation

enum NetworkingUsersError: Error {
    case usersURLNotFound
    case userNilData
    case unknown
}

enum NetworkingNewsError: Error {
    case newsURLNotFound
    case newsNilData
    case unknown
}


//
//  NewsModel.swift
//  ChallengeTecnico1
//
//  Created by Manuela on 28/05/2024.
//

import Foundation

struct News: Codable {
    let id: Int
    let slug: String
    let url: String
    let title: String
    let content: String
    let image: String
    let thumbnail: String
    let status: String
    let category: String
    let publishedAt: String
    let updatedAt: String
    let userId: Int
}

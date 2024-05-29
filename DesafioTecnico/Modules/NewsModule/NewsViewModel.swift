//
//  NewsViewModel.swift
//  ChallengeTecnico1
//
//  Created by Manuela on 28/05/2024.
//

import Foundation
import Combine

class NewsViewModel: ObservableObject {
    @Published var news: [News] = []
    @Published var searchText: String = ""

    init() {
        loadNews()
    }

    func loadNews() {
        news = [
            News(title: "Title 1", body: "Content 1"),
            News(title: "Title 2", body: "Content 2"),
        ]
    }

    var filteredNews: [News] {
        if searchText.isEmpty {
            return news
        } else {
            return news.filter { $0.title.contains(searchText)}
        }
    }
}


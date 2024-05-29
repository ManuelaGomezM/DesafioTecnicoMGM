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
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        loadNews()
        searchNews()
    }

    func loadNews() {
        news = [
            News(title: "Title 1", body: "Content 1"),
            News(title: "Title 2", body: "Content 2"),
        ]
    }

    private func searchNews() {
        $searchText
            .combineLatest($news)
            .map { searchText, news in
                guard !searchText.isEmpty else { return news }
                return news.filter { $0.title.contains(searchText) }
            }
            .assign(to: &$filteredNews)
    }
    
    @Published private(set) var filteredNews: [News] = []
}


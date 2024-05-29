//
//  NewsViewModel.swift
//  ChallengeTecnico1
//
//  Created by Manuela on 28/05/2024.
//

import Foundation
import Combine

final class NewsViewModel: ObservableObject {
    @Published var news: [News] = []
    @Published var searchText: String = ""
    @Published private(set) var filteredNews: [News] = []
    
    private var cancellables: Set<AnyCancellable> = []
    private let newsService: NewsService
    
    init(newsService: NewsService = NewsService()) {
        self.newsService = newsService
        loadNews()
        searchNews()
    }
    
    func loadNews() {
        newsService.getNews { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedNews):
                    self?.news = fetchedNews
                case .failure(let error):
                    print("Failed to fetch users: \(error)")
                }
            }
        }
    }
    
    private func searchNews() {
        $searchText
            .combineLatest($news)
            .map { searchText, news in
                guard !searchText.isEmpty else { return news }
                return news.filter { $0.title.contains(searchText) || $0.content.contains(searchText) }
            }
            .assign(to: &$filteredNews)
    }
}

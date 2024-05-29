//
//  NewsService.swift
//  DesafioTecnico
//
//  Created by Manuela on 29/05/2024.
//

import Foundation

final class NewsService {
    func getNews(completion: @escaping (Result<[News], Error>) -> Void) {
            guard let newsUrl = URL(string: "https://jsonplaceholder.org/posts") else {
                completion(.failure(NetworkingNewsError.newsURLNotFound))
                return
            }
            
            URLSession.shared.dataTask(with: newsUrl) { data, response, error in
                guard let data = data, error == nil else {
                    completion(.failure(NetworkingNewsError.newsNilData))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let news = try decoder.decode([News].self, from: data)
                    completion(.success(news))
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(.failure(error))
                }
            }.resume()
        }
}

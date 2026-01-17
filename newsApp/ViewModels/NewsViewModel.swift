//
//  NewsViewModel.swift
//  newsApp
//
//  Created by Togrul Hashimov on 16.01.26.
//

import Foundation
internal import Combine

@MainActor
class NewsViewModel: ObservableObject {
    private let networkService = NetworkService.shared
    
    @Published var articles: [NewsArticle] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    func fetchNews() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await networkService.fetchTopHeadlines()
            self.articles = response.articles
            self.isLoading = false
        } catch {
            self.errorMessage = "Failed to load news: \(error.localizedDescription)"
            self.isLoading = false
        }
    }
}

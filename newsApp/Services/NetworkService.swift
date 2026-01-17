//
//  NetworkService.swift
//  newsApp
//
//  Created by Togrul Hashimov on 16.01.26.
//

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    private let baseURL = "https://newsapi.org/v2"
    // Note: Replace with your NewsAPI key or use a demo endpoint
    // Get your free API key at https://newsapi.org/
    private let apiKey = "3a367a2332c5487b951a63a3c531f57a"
    
    private init() {}
    
    func fetchTopHeadlines() async throws -> NewsResponse {
        // Use real API if apiKey is set, otherwise use mock data
        guard !apiKey.isEmpty,
              apiKey == "3a367a2332c5487b951a63a3c531f57a",
              let url = URL(string: "\(baseURL)/top-headlines?country=us&apiKey=\(apiKey)") else {
            // Fallback to mock data
            return try await fetchMockNews()
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
            return newsResponse
        } catch {
            // If API call fails, use mock data
            return try await fetchMockNews()
        }
    }
    
    private func fetchMockNews() async throws -> NewsResponse {
        // Mock news data for demonstration
        // Simulate network delay
        try await Task.sleep(nanoseconds: 500_000_000) // 0.5 seconds
        
        let mockArticles = [
            NewsArticle(
                title: "Breaking: Major Tech Innovation Announced",
                description: "A revolutionary new technology has been unveiled that promises to change the industry.",
                url: "https://example.com/news1",
                urlToImage: nil,
                publishedAt: ISO8601DateFormatter().string(from: Date()),
                source: NewsSource(name: "Tech News")
            ),
            NewsArticle(
                title: "Global Markets Reach New Heights",
                description: "Stock markets around the world have reached unprecedented levels this quarter.",
                url: "https://example.com/news2",
                urlToImage: nil,
                publishedAt: ISO8601DateFormatter().string(from: Date().addingTimeInterval(-3600)),
                source: NewsSource(name: "Financial Times")
            ),
            NewsArticle(
                title: "Climate Summit Yields Historic Agreement",
                description: "World leaders have reached a consensus on new climate action measures.",
                url: "https://example.com/news3",
                urlToImage: nil,
                publishedAt: ISO8601DateFormatter().string(from: Date().addingTimeInterval(-7200)),
                source: NewsSource(name: "Global News")
            ),
            NewsArticle(
                title: "Sports Championship Ends in Dramatic Fashion",
                description: "The final match of the season concluded with an unexpected victory.",
                url: "https://example.com/news4",
                urlToImage: nil,
                publishedAt: ISO8601DateFormatter().string(from: Date().addingTimeInterval(-10800)),
                source: NewsSource(name: "Sports Daily")
            ),
            NewsArticle(
                title: "New Study Reveals Health Benefits",
                description: "Researchers have discovered significant health improvements from a new treatment method.",
                url: "https://example.com/news5",
                urlToImage: nil,
                publishedAt: ISO8601DateFormatter().string(from: Date().addingTimeInterval(-14400)),
                source: NewsSource(name: "Health Journal")
            )
        ]
        
        return NewsResponse(
            status: "ok",
            totalResults: mockArticles.count,
            articles: mockArticles
        )
    }
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

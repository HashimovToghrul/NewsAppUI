//
//  NewsArticle.swift
//  newsApp
//
//  Created by Togrul Hashimov on 16.01.26.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [NewsArticle]
}

struct NewsArticle: Codable, Identifiable {
    var id: String { url } // Use URL as unique identifier
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let source: NewsSource
    
    var publishedDate: Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: publishedAt)
    }
    
    var formattedDate: String {
        guard let date = publishedDate else { return publishedAt }
        let displayFormatter = DateFormatter()
        displayFormatter.dateStyle = .medium
        displayFormatter.timeStyle = .short
        return displayFormatter.string(from: date)
    }
}

struct NewsSource: Codable {
    let name: String
}

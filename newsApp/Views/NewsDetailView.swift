//
//  NewsDetailView.swift
//  newsApp
//
//  Created by Togrul Hashimov on 16.01.26.
//

import SwiftUI
import SafariServices

struct NewsDetailView: View {
    let article: NewsArticle
    @State private var showSafari = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack {
                    Text(article.source.name)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    
                    Spacer()
                    
                    Text(article.formattedDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                Divider()
                
                if let description = article.description {
                    Text(description)
                        .font(.body)
                } else {
                    Text("No description available")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                Button(action: {
                    showSafari = true
                }) {
                    Text("Read Full Article")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationTitle("Article Details")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showSafari) {
            if let url = URL(string: article.url) {
                SafariView(url: url)
            }
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}

#Preview {
    NavigationView {
        NewsDetailView(article: NewsArticle(
            title: "Sample Article",
            description: "This is a sample description",
            url: "https://example.com",
            urlToImage: nil,
            publishedAt: ISO8601DateFormatter().string(from: Date()),
            source: NewsSource(name: "Sample Source")
        ))
    }
}

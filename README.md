# News App

A simple iOS news app built with UIKit, UITableView, and MVVM architecture.

## Features

- **MVVM Architecture**: Clean separation of concerns with Model, View, and ViewModel
- **UITableView**: Displays news articles in a scrollable list
- **API Integration**: Fetches news from NewsAPI (with mock data fallback)
- **Pull to Refresh**: Swipe down to refresh the news feed
- **Detail View**: Tap on any article to view details and read the full article

## Architecture

### Model
- `NewsArticle.swift`: Represents a news article with title, description, URL, source, and date

### ViewModel
- `NewsViewModel.swift`: Manages the business logic, fetches data, and notifies views of updates

### View
- `NewsViewController.swift`: Main view controller with UITableView
- `NewsTableViewCell.swift`: Custom cell for displaying news articles
- `NewsDetailViewController.swift`: Detail view for individual articles

### Service
- `NetworkService.swift`: Handles API calls to fetch news data

## Setup

1. **API Key (Optional)**: 
   - The app currently uses mock data for demonstration
   - To use real news data, get a free API key from [NewsAPI.org](https://newsapi.org/)
   - Update the `apiKey` property in `NetworkService.swift`

2. **Build and Run**:
   - Open the project in Xcode
   - Select your target device or simulator
   - Press Cmd+R to build and run

## Project Structure

```
newsApp/
├── Models/
│   └── NewsArticle.swift
├── ViewModels/
│   └── NewsViewModel.swift
├── Views/
│   ├── NewsViewController.swift
│   ├── NewsTableViewCell.swift
│   └── NewsDetailViewController.swift
├── Services/
│   └── NetworkService.swift
└── AppDelegate.swift
```

## Requirements

- iOS 13.0+
- Xcode 14.0+
- Swift 5.0+

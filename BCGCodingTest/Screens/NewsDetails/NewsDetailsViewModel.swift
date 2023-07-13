//
//  NewsDetailsViewModel.swift
//  BCGCodingTest
//
//  Created by Mohammed Sadiq on 13/07/23.
//

import Foundation

class NewsDetailsViewModel {
    
    var newsDetailsResults: NewsResults? = nil
    
    init(newsDetailResults: NewsResults) {
        self.newsDetailsResults = newsDetailResults
    }
    
}

extension NewsDetailsViewModel {
    func getPosterImageUrl() -> String? {
        return self.newsDetailsResults?.getImageURL(type: .Large)
    }
}

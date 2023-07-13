//
//  ViewModel.swift
//  BCGCodingTest
//
//  Created by Mohammed Sadiq on 13/07/23.
//

import Foundation
import Combine

//ViewModel to process the List of news
class NewsListViewModel {
    
    var mNewsDetails: NewsDetails? = nil
    // Invokes the Controller when data changes
    @Published var currentNewsDetails: NewsDetails? = nil
    
    init() {
        
    }
    
    func performInitialSetup() {
        loadNewsList()
    }
    
    // Loads the list of News 
    func loadNewsList() {
        APICallHelper().fetchNewsDetails { result, error in
            guard error == nil else {
                // Display the Error in View Controller
                return
            }
            
            self.currentNewsDetails = result
        }
    }
    
}

extension NewsListViewModel {
    
    func getNoOfResults() -> NSInteger {
        return currentNewsDetails?.results?.count ?? 0
    }
    
    func getResultFor(index: NSInteger) -> NewsResults? {
        let resultsCount = self.getNoOfResults()
        guard resultsCount > 0 && index < resultsCount else {
            return nil
        }
        
        return currentNewsDetails?.results?[index]
    }
}

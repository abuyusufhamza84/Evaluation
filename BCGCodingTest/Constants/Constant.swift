//
//  Constant.swift
//  BCGCodingTest
//
//  Created by Mohammed Sadiq on 11/07/23.
//

import Foundation
import UIKit

// Add the ~ prefix operator to use as shortcut for Localized String
prefix operator ~
prefix func ~ (string: String) -> String {
    return NSLocalizedString(string, comment: "")
}

struct Constant {
    static let emptyString = ""
    static let spaceString = " "
    
    /// struct for constant for ButtonOpacity values
    struct Api {
        static let topStories = "https://api.nytimes.com/svc/topstories/v2/world.json?"
    }
    
    struct Key {
        static let apiKey = "RiTezICSAaZ5XpGZmatS198JEYwMiaBT"
    }
    
    struct Title {
        static let titleWorldNews = ~"World News"
        static let titleNewsDetails = ~"Details"
    }
    
}


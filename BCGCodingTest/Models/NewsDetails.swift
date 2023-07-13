//
//  NewsDetails.swift
//  BCGCodingTest
//
//  Created by Mohammed Sadiq on 12/07/23.
//

import Foundation

protocol BaseModel: Codable {
}

struct NewsDetails: BaseModel {
    let status, copyright, section, lastUpdated : String?
    let numOfResults: NSInteger?
    let results: [NewsResults]?
    
    enum CodingKeys: String, CodingKey {
        case status, copyright, section, lastUpdated = "last_updated",
             numOfResults = "num_results", results
    }
}

struct NewsResults: BaseModel {
    let section, subsection, title, abstract, url, uri, byline, itemType : String?
    let multimedia: [NewsMultimediaDetails]?
    
    enum CodingKeys: String, CodingKey {
        case section, subsection, title, abstract, url, uri, byline, itemType = "item_type", multimedia
    }
}

struct NewsMultimediaDetails: BaseModel {
    let url, format, type, subtype, caption, copyright: String?
    let height, width: Float?
    
    enum CodingKeys: String, CodingKey {
        case url, format, type, subtype, caption, copyright
        case height, width
    }
}

extension NewsResults {
        
    func getThumbnailImageUrl() -> String? {
        let imageInfo = self.multimedia?.filter({
            return ($0.format ?? "" == NewsImageTypes.Thumbnail.rawValue) && ($0.type == MultimediaTypes.image.rawValue)
        })
        return imageInfo?.first?.url
    }
    
    func getPosterImageUrl() -> String? {
       return self.multimedia?.filter({
           return ($0.format == NewsImageTypes.Large.rawValue) && ($0.type == MultimediaTypes.image.rawValue)
        }).first?.url
    }
    
    func getImageURL(type: NewsImageTypes) -> String? {
        return self.multimedia?.filter({
           return ($0.format == type.rawValue) && ($0.type == MultimediaTypes.image.rawValue)
        }).first?.url
    }
}

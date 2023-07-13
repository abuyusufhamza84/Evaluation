//
//  APIServiceManager.swift
//  BCGCodingTest
//
//  Created by Mohammed Sadiq on 11/07/23.
//

import Foundation
import Alamofire

class APIServiceManager {
    /// Shared Instance of APIServiceManager
    private(set) static var shared = APIServiceManager()
    
    /// Retry limit 
    static let retryLimit = 1 // 3 - Timeout will also retry
    
    
    init() {
    }
    
    // Performs the network request
    func performRequest<T: Codable> (of type: T.Type,
                                    onCompletion handler: @escaping (Result<Data?, AFError>) -> Void) {
        
        //TODO :
        /*
         * Implement the Router for URL's & Parameters
         * 
         */
        let parameters = ["api-key": Constant.Key.apiKey]
        AF.request(Constant.Api.topStories, parameters: parameters).response { response in
            debugPrint(response)
            handler(response.result)
        }
        
        
    }
}

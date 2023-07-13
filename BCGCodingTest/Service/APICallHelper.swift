//
//  APICallHelper.swift
//  BCGCodingTest
//
//  Created by Mohammed Sadiq on 12/07/23.
//

import Foundation

//Helper for Invoking the API's
struct APICallHelper {
    
    func fetchNewsDetails(completionHandler: @escaping (_ result: NewsDetails?, _ error: Error?) -> Void) {
        APIServiceManager.shared.performRequest(of: NewsDetails.self) { response in
            switch response {
            case .success(let newsDetailsData) :
                do {
                    let newsDetails = try JSONDecoder().decode(NewsDetails.self, from: newsDetailsData ?? Data())
                    debugPrint(newsDetails)
                    completionHandler(newsDetails, nil)
                }catch {
//                    completionHandler(nil, AppError.decodingError(Error))
                }
            case .failure(let error) :
                debugPrint(error)
                completionHandler(nil, error)
                // Handle the Error
            }
        }
    }
}

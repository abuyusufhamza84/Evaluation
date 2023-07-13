//
//  ResponseHandler.swift
//  Horizon
//
//  Created by Dharmendra Sinha on 14/03/22.
//

import UIKit
import Alamofire

/// This struct is to handle response of api based on Business requirement . Not included in the Code Flows
struct ResponseHandler {
   
    /// Method to handle response based on status codes and other things as well. It takes Alamofire response object adn router and completion block
    static func handleResponse<T: Codable>(response: AFDataResponse<T>, 
                                           onCompletion: @escaping (Result<T, Error>) -> Void) {

    }
}

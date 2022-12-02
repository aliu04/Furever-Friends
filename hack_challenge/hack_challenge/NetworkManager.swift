//
//  NetworkManager.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-29.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let host = "http://34.85.163.32/api"
    
    static func getAllUsers(completion: @escaping (DogResponse) -> Void) {
        let endpoint = "\(host)/users/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                if let userResponse = try? jsonDecoder.decode(DogResponse.self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllUsers")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}


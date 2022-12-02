//
//  NetworkManager.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-29.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let host = "http://34.86.197.231/api"
    
    static func getAllUsers(completion: @escaping ([Dog]) -> Void) {
        let endpoint = "\(host)/users/"
        AF.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .iso8601
                if let userResponse = try? jsonDecoder.decode([Dog].self, from: data) {
                    completion(userResponse)
                } else {
                    print("Failed to decode getAllPosts")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
//    static func getAllDogs(completion: @escaping ([Dog]) -> Void) {
//        let endpoint = "\(host)/users/"
//        AF.request(endpoint, method: .get).validate().responseData { response in
//            switch response.result {
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                if let userResponse = try? jsonDecoder.decode([Dog].self, from: data) {
//                    completion(userResponse)
//                } else {
//                    print("Failed to decode getAllBooks")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
}


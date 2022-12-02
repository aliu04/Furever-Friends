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
    
    static func createDog(age: Int, bio: String, name: String, images: [Image], completion: @escaping (Dog) -> Void) {
        let endpoint = "\(host)/users/"
        let param: Parameters = [
            "name": name,
            "age": age,
            "bio": bio,
            "images": images
        ]
        AF.request(endpoint, method: .post, parameters: param, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Dog.self, from: data) {
                    completion(userResponse)
                } else {
                    print("failed to decode createDog")
                }
            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func updateDog(id: Int, age: Int, bio: String, name: String, images: [Image], completion: @escaping (DogResponse) -> Void) {
        let endpoint = "\(host)/users/\(id)/"
        
        let params: Parameters = [
            "name": name,
            "age": age
        ]
        AF.request(endpoint, method: .post, parameters: params).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(DogResponse.self, from: data) {
                    completion(userResponse)
                } else {
                    print("failed to decode updateDog")
                }
            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    static func createMatch(id1: Int, id2: Int, completion: @escaping (Match) -> Void) {
        let endpoint = "\(host)/matches/"
        let params: Parameters = [
            "user_1_id": id1,
            "user_2_id": id2
        ]
        AF.request(endpoint, method: .post, parameters: params, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(Match.self, from: data) {
                    completion(userResponse)
                    print("match worked")
                } else {
                    print("failed to decode createMatch")
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}


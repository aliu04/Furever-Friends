//
//  Dog.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-28.
//

import Foundation
import UIKit

//class Dog {
//    var dogImage: String
//    var dogName: String
//    var dogDescription: String
//    var dogAge: Int
//    //var dogSize: Int
//    //var dogVolume: Int
//    var displayed: Bool
//    //var match: Bool
//
//    init(dogImage: String, dogName: String, dogDescription: String, displayed: Bool, dogAge: Int) {
//        self.dogImage = dogImage
//        self.dogName = dogName
//        self.dogDescription = dogDescription
//        self.dogAge = dogAge
//        //self.dogSize = dogSize
//        //self.dogVolume = dogVolume
//        self.displayed = displayed
//    }
//
//}

struct Image: Codable {
    let url: String
    let created_at: String
}

struct Dog: Codable {
    let id: Int
    let age: Int
    let bio: String
    let name: String
    let images: [Image]
    
    enum CodingKeys: String, CodingKey {
        case id
        case age
        case bio
        case name
        case images
    }
    
}

struct DogResponse: Codable {
    let users: [Dog]
}

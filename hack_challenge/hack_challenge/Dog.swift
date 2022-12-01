//
//  Dog.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-11-28.
//

import Foundation
import UIKit

class Dog {
    var dogImage: String
    var dogName: String
    var dogDescription: String
    var dogSize: Int
    var dogVolume: Int
    var displayed: Bool

    init(dogImage: String, dogName: String, dogDescription: String, dogSize: Int, dogVolume: Int, displayed: Bool) {
        self.dogImage = dogImage
        self.dogName = dogName
        self.dogDescription = dogDescription
        self.dogSize = dogSize
        self.dogVolume = dogVolume
        self.displayed = displayed
    }

}

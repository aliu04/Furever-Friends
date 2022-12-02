//
//  Match.swift
//  hack_challenge
//
//  Created by Ashley Liu on 2022-12-02.
//

import Foundation

struct Match: Codable {
    let id: Int
    let time_stamp: String
    let user_1_id: Int
    let user_2_id: Int
    let accepted: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case time_stamp
        case user_1_id
        case user_2_id
        case accepted
    }

}

struct MatchResponse: Codable {
    let users: [Dog]
}

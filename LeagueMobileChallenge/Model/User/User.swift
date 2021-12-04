//
//  User.swift
//  LeagueMobileChallenge
//
//  Created by Amanda Hanig Brust on 04/12/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Int
//    var avatar: String
    var avatar: Avatar
    var name: String
    var username: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
}

struct Avatar: Codable {
    var large, medium, thumbnail: String
}

struct Address: Codable {
    var street, suite, city, zipcode: String
    var geo: Geo
}

struct Company: Codable {
    var name, catchPhrase, bs: String
}

struct Geo: Codable {
    var lat, lng: String
}

//        "avatar": {
//            "large": ".../women/71.jpg",
//            "medium": ".../med/women/71.jpg",
//            "thumbnail": ".../thumb/women/71.jpg"
//        },

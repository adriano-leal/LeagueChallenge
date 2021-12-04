//
//  Constants.swift
//  LeagueMobileChallenge
//
//  Created by Amanda Hanig Brust on 04/12/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

struct Constants {
    struct Domain {
        static let baseURL = "https://engineering.league.dev/challenge/api"
    }
    
    struct APIParameterKey {
        static let apiKey = "5ECDDC3A21CE53428227A2125B7FCC71"
    }
}

public enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

public enum ContentType: String {
    case json = "application/json"
}

//
//  EndpointsProtocol.swift
//  LeagueMobileChallenge
//
//  Created by Amanda Hanig Brust on 04/12/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Alamofire

protocol EndpointsProtocol: URLRequestConvertible {
    var method: HTTPMethod          { get }
    var path: String                { get }
    var parameters: Parameters?     { get }
    var headers: [String: String]?  { get }
}

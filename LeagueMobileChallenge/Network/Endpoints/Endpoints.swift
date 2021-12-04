//
//  Endpoints.swift
//  LeagueMobileChallenge
//
//  Created by Amanda Hanig Brust on 04/12/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Alamofire

enum Endpoints: EndpointsProtocol {
    
    case login
    case posts
    case users
    case postsFromUsers(userId: Int)
    
    var method: HTTPMethod {
        switch self {
        case .login, .posts, .users, .postsFromUsers:
            return .get
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login, .posts, .users, .postsFromUsers:
            return ["x-access-token": Constants.APIParameterKey.apiKey]
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "\(Constants.Domain.baseURL)/login"
        case .posts:
            return "\(Constants.Domain.baseURL)/posts"
        case .users:
            return "\(Constants.Domain.baseURL)/users"
        case .postsFromUsers(let userId):
            return "\(Constants.Domain.baseURL)/posts?userId=\(userId)"
        }
    }

    var parameters: Parameters? {
        switch self {
        case .users, .posts, .login, .postsFromUsers:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = path
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.allHTTPHeaderFields = headers ?? [:]
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        debugPrint(urlRequest)
        return urlRequest
    }
    
    
}

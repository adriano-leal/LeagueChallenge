//
//  APIController.swift
//  LeagueMobileChallenge
//
//  Created by Kelvin Lau on 2019-01-14.
//  Copyright © 2019 Kelvin Lau. All rights reserved.
//

import Alamofire
import UIKit

class APIController {
    
    @discardableResult
    private static func request(route: Endpoints, completion: @escaping (DataResponse<Any>?) -> Void) -> DataRequest {
        return Alamofire
            .request(route)
            .validate()
            .responseJSON { (response: DataResponse<Any>?) in
                completion(response)
            }
    }
    
    func fetchPosts(completion: @escaping ([Post]?, Error?) -> Void) {
        APIController.request(route: .posts) { response in
            if response?.error == nil {
                if let data = response?.data, let utf88Text = String(data: data, encoding: .utf8) {
                    let json = utf88Text.data(using: .utf8)
                    do {
                        let decoder = JSONDecoder()
                        let decodedJosn = try decoder.decode([Post].self, from: json!)
                        completion(decodedJosn, nil)
                    } catch {
                        debugPrint(error)
                        completion(nil, error)
                    }
                }
            } else {
                // manage error
            }
        }
        
    }
    
    static func fetchUsers(completion: @escaping ([User]?, Error?) -> Void) {
        request(route: .users) { response in
            if response?.error == nil {
                if let data = response?.data, let utf8Text = String(data: data, encoding: .utf8) {
                    let json = utf8Text.data(using: .utf8)
                    do {
                        let decoder = JSONDecoder()
                        let decodedJson = try decoder.decode([User].self, from: json!)
                        completion(decodedJson, nil)
                    } catch {
                        completion(nil, error)
                    }
                }
            } else {
                // manage error
            }
        }
    }
    
    static func fetchPostsFromUser(userId: Int, completion: ([Post]?, Error?) -> Void) {
        
    }
    
}

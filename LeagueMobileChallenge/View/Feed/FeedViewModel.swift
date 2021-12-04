//
//  FeedViewModel.swift
//  LeagueMobileChallenge
//
//  Created by Amanda Hanig Brust on 04/12/21.
//  Copyright © 2021 Kelvin Lau. All rights reserved.
//

import Foundation
import UIKit

class FeedViewModel: NSObject {
    
    var service: APIController
    var user: [User] = []
    var posts: [Post] = []
    
    init(service: APIController) {
        self.service = service
    }
    
    func getPosts() {
        service.fetchPosts { [weak self] resp, err in
            guard let self = self else { return }
            if resp != nil {
                self.posts = resp ?? []
            } else {
                // manage error
            }
        }
    }
    
    func getUsers() {
        
    }
    
}

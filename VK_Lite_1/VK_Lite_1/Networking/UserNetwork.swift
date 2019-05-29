//
//  UserNetwork.swift
//  VK_Lite_1
//
//  Created by Alexander Filippov on 27/05/2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserNetwork {
    public func loadUsers(token: String, completion: ((Swift.Result<[User], Error>) -> Void)? = nil) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/friends.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.95",
            "fields": "photo_id, photo_50"
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let users = json["response"]["items"].arrayValue.map { User($0) }
                completion?(.success(users))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}

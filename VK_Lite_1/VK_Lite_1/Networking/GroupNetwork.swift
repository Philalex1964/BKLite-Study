//
//  GroupNetwork.swift
//  VK_Lite_1
//
//  Created by Alexander Filippov on 29/05/2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class GroupNetwork {
    public func loadGroups(token: String, completion: ((Swift.Result<[Group], Error>) -> Void)? = nil) {
        let baseUrl = "https://api.vk.com"
        let path = "/method/groups.get"
        
        let params: Parameters = [
            "access_token": token,
            "extended": 1,
            "v": "5.95",
        ]
        
        Alamofire.request(baseUrl + path, method: .get, parameters: params).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let groups = json["response"]["items"].arrayValue.map { Group($0) }
                completion?(.success(groups))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}

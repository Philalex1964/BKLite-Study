//
//  User.swift
//  VK_Lite_1
//
//  Created by Alexander Filippov on 27/05/2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    let firstName: String
    let lastName: String
    let photo: String
    
    init(_ json: JSON) {
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.photo = json["photo_50"].stringValue
    }
    
}

//{
//    "response": {
//        "count": 13,
//        "items": [
//        {
//        "id": 577923,
//        "first_name": "Алина",
//        "last_name": "Шеварыкина",
//        "is_closed": false,
//        "can_access_closed": true,
//        "photo_50": "https://pp.userapi.com/c830401/v830401708/124075/sMnvXBupndg.jpg?ava=1",
//        "photo_id": "577923_456239313",
//        "online": 0
//        },
//        {
//        "id": 15350802,
//        "first_name": "Анастасия",
//        "last_name": "Филиппова",
//        "is_closed": false,
//        "can_access_closed": true,
//        "photo_50": "https://pp.userapi.com/c630529/v630529802/2752a/lzXEa0r0fjE.jpg?ava=1",
//        "photo_id": "15350802_412006572",
//        "online": 0
//        }
//        ]
//   }
//}

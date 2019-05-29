//
//  Group.swift
//  VK_Lite_1
//
//  Created by Alexander Filippov on 29/05/2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation
import SwiftyJSON

class Group {
    let groupName: String
    let photo: String
    
    init(_ json: JSON) {
        self.groupName = json["name"].stringValue
        self.photo = json["photo_50"].stringValue
    }
    
}


//{
//    "response": {
//        "count": 11,
//        "items": [
//        {
//        "id": 28241045,
//        "name": "Юбилейный Квартал и Шуваловский",
//        "screen_name": "jubilejnyj_kvartal",
//        "is_closed": 0,
//        "type": "group",
//        "is_admin": 0,
//        "is_member": 1,
//        "is_advertiser": 0,
//        "photo_50": "https://sun9-31.userapi.com/c638726/v638726290/cd54/oPidvVSIpf0.jpg?ava=1",
//        "photo_100": "https://sun9-18.userapi.com/c638726/v638726290/cd53/DYEB6D0oha4.jpg?ava=1",
//        "photo_200": "https://sun9-4.userapi.com/c638726/v638726290/cd52/YQq5F6ucne0.jpg?ava=1"
//        },

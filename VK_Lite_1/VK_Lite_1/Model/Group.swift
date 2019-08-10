//
//  Group.swift
//  VK_Lite_1
//
//  Created by Alexander Filippov on 29/05/2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Group: Object {
    @objc dynamic var groupName: String = ""
    @objc dynamic var photo: String = ""
    @objc dynamic var id: Int = 0
    
    convenience init(_ json: JSON) {
        self.init()
        
        self.groupName = json["name"].stringValue
        self.photo = json["photo_50"].stringValue
        self.id = json["id"].intValue
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
}


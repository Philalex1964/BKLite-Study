//
//  User.swift
//  VK_Lite_1
//
//  Created by Alexander Filippov on 27/05/2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class User: Object {
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var photo: String = ""
    @objc dynamic var id: Int = 0
    
    convenience init(_ json: JSON) {
        self.init()
        
        self.firstName = json["first_name"].stringValue
        self.lastName = json["last_name"].stringValue
        self.photo = json["photo_50"].stringValue
        self.id = json["id"].intValue
    }
    
}


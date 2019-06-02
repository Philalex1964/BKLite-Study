//
//  Photo.swift
//  VK_Lite_1
//
//  Created by user on 29/05/2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

class Photo: Object {
    @objc dynamic var id: Int = 0
    @objc private dynamic var urlString: String = ""
    
    var url: URL? {
        return URL(string: urlString)
    }
    
    convenience init(_ json: JSON) {
        self.init()
        
        self.urlString = json["sizes"].arrayValue.last?["url"].stringValue ?? ""
        self.id = json["id"].intValue
    }
}

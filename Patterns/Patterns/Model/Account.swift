//
//  Account.swift
//  Patterns
//
//  Created by user on 15/05/2019.
//  Copyright © 2019 Morizo Digital. All rights reserved.
//

import Foundation

class Account {
    private init() { }
    
    public static let shared = Account()
    
    var name = "Andrey Antropov"
    var id = 0
    var moneyAmount = 1000
}

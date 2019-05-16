//
//  ManagementController.swift
//  Patterns
//
//  Created by user on 15/05/2019.
//  Copyright © 2019 Morizo Digital. All rights reserved.
//

import UIKit

class ManagementController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var moneyTextField: UITextField!
    
    @IBAction func okBtnPressed(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let moneyString = moneyTextField.text,
            let money = Int(moneyString) else { return }
        
        Account.shared.name = name
        Account.shared.moneyAmount = money
        
        let color = UIColor(red: CGFloat.random(in: 0...255)/255,
                            green: CGFloat.random(in: 0...255)/255,
                            blue: CGFloat.random(in: 0...255)/255,
                            alpha: 1.0)
        NotificationCenter.default.post(name: Notification.Name.ColorChanged,
                                        object: nil,
                                        userInfo: ["color" : color])
    }
}

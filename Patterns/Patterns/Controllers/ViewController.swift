//
//  ViewController.swift
//  Patterns
//
//  Created by user on 15/05/2019.
//  Copyright © 2019 Morizo Digital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeColor(_:)),
                                               name: NSNotification.Name.ColorChanged,
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.ColorChanged, object: nil)
    }
    
    @objc func changeColor(_ notificatation: Notification) {
        guard let color = notificatation.userInfo?["color"] as? UIColor else { return }
        
        view.backgroundColor = color
    }
}

//
//  LabelViewController.swift
//  Patterns
//
//  Created by user on 15/05/2019.
//  Copyright © 2019 Morizo Digital. All rights reserved.
//

import UIKit

class LabelViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    public var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = text
    }
}

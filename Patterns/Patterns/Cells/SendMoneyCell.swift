//
//  SendMoneyCell.swift
//  Patterns
//
//  Created by user on 15/05/2019.
//  Copyright © 2019 Morizo Digital. All rights reserved.
//

import UIKit

protocol SendMoneyCellDelegate: class {
    func sendButtonPressed(to name: String?, amount: Int)
}

class SendMoneyCell: UITableViewCell {
    
    static let reuseId = "SendMoneyCell"

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var amountTextField: UITextField!
    
    public weak var delegate: SendMoneyCellDelegate?
    public var sendButtonHandler: ((Int) -> Void)?
    
    @IBAction func sendBtnPressed(_ sender: UIButton) {
        guard let moneyString = amountTextField.text,
            let moneyAmount = Int(moneyString) else { return }
        
       self.delegate?.sendButtonPressed(to: nameLabel.text, amount: moneyAmount)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.curveEaseInOut, animations: {
            self.nameLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }) { completed in
            if completed {
                
                self.sendButtonHandler?(moneyAmount)
            }
        }
    }
}

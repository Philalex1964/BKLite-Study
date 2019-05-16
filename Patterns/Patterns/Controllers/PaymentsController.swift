//
//  PaymentsController.swift
//  Patterns
//
//  Created by user on 15/05/2019.
//  Copyright © 2019 Morizo Digital. All rights reserved.
//

import UIKit

class PaymentsController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    private var friends = ["Alice", "Bob", "Cecil"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = Account.shared.name
        moneyLabel.text = String(Account.shared.moneyAmount)
    }
}

extension PaymentsController: UITableViewDelegate {
    
}

extension PaymentsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SendMoneyCell", for: indexPath) as? SendMoneyCell else { return UITableViewCell() }
        
        cell.nameLabel.text = friends[indexPath.row]
        cell.delegate = self
        cell.sendButtonHandler = { [weak self] moneyAmount in
            self?.performSegue(withIdentifier: "showLabel", sender: cell)
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showLabel",
            let destinationVC = segue.destination as? LabelViewController,
            let sendMoneyCell = sender as? SendMoneyCell {
            destinationVC.text = sendMoneyCell.nameLabel.text
        }
    }
}

extension PaymentsController: SendMoneyCellDelegate {
    func sendButtonPressed(to name: String?, amount: Int) {
        guard let name = name,
            friends.contains(name) else { return }
        
        if Account.shared.moneyAmount >= amount {
            Account.shared.moneyAmount -= amount
            moneyLabel.text = String(Account.shared.moneyAmount)
        } else {
            let alertVC = UIAlertController(title: "Error", message: "not enough money", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }
    }
}

//
//  NewsTVController.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 25.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

class NewsTVController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {fatalError("Cell cannot be dequeued")}
        
        return cell
    }
}

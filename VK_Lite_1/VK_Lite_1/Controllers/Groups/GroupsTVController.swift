//
//  GroupsTVController.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 07.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

class GroupsTVController: UITableViewController {

    private var groupNetwork = GroupNetwork()
    public var groups: Results<Group> = try! Realm().objects(Group.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupNetwork.loadGroups(token: Account.shared.token)
        { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let groups):
                let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
                let realm = try! Realm(configuration: config)
                try! realm.write {
                    realm.add(groups, update: .modified)
                }
                print(realm.configuration.fileURL)
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.reuseId, for: indexPath) as? GroupCell else { fatalError("Cell cannot be dequeued")}

        let group = groups[indexPath.row]
        cell.configure(with: group)
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
//            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if let recommendedGroupsController = segue.source as? RecommendedGroupsController,
            let indexPath = recommendedGroupsController.tableView.indexPathForSelectedRow {
            let newGroup = recommendedGroupsController.groups[indexPath.row]
            
            guard !groups.contains(where: { group -> Bool in
                return group.groupName == newGroup.groupName
            }) else { return }
            let newIndexPath = IndexPath(item: groups.count-1, section: 0)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
}


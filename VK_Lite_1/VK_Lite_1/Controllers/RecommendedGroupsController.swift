//
//  RecommendedGroupsController.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 09.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit
import CoreData

class RecommendedGroupsController: UIViewController, NSFetchedResultsControllerDelegate {
    
    public var groupName = ""
    
    var fetchResultController: NSFetchedResultsController<GroupMO>!
    
    public var groups: [GroupMO] = []
    
    var context: NSManagedObjectContext!
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            
            title = groupName
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
        
        insertGroupData()

        //MARK: - Fetch data from data store
        let fetchRequest: NSFetchRequest<GroupMO> = GroupMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "groupName", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            fetchResultController = NSFetchedResultsController(fetchRequest:
                fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil,
                              cacheName: nil)
            fetchResultController.delegate = self
            do {
                try fetchResultController.performFetch()
                if let fetchedObjects = fetchResultController.fetchedObjects {
                    groups = fetchedObjects
                }
            } catch {
                print(error)
            }
        }
    }
    
    //MARK: - Insert Data from group.plist
    func insertGroupData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let path = Bundle.main.path(forResource: "GroupData", ofType: "plist")!
        let dataArray = NSArray(contentsOfFile: path)! //as! [[String: Any]]
        
        for dict in dataArray {
            let entity = NSEntityDescription.entity(forEntityName: "Group", in: context)!
            let group = GroupMO(entity: entity,
                                insertInto: context)
            let groupDict = dict as! [String: Any]
            
            group.groupName = groupDict["groupName"] as? String
            group.groupTopic = groupDict["groupTopic"] as? String
            group.groupImageName = groupDict["groupImageName"] as? String
        }
        try! context.save()
    }
}

extension RecommendedGroupsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.reuseId, for: indexPath) as? GroupCell else { fatalError("Cell cannot be dequeued")}
        
        cell.groupnameLabel.text = groups[indexPath.row].groupName
        cell.groupImage.image = UIImage(named: groups[indexPath.row].groupImageName!)
        
        return cell        
    }
}

extension RecommendedGroupsController: UITableViewDelegate {
    
}

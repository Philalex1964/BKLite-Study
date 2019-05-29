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
    
    @IBOutlet weak var searchBar: UISearchBar!{
        didSet {
            searchBar.delegate = self
        }
    }
    
    public var groupName = ""
    
    //var fetchResultController: NSFetchedResultsController<GroupMO>!
    
    //public var groups: [Group] = []
    public var groupNetwork = GroupNetwork()
    public var groups = [Group]()
    
    var context: NSManagedObjectContext!
    
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            
            title = groupName
        }
    }
    
    // MARK: SearchBar
    private var filteredGroups = [Group]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Fetch data from data store
//        let fetchRequest: NSFetchRequest<GroupMO> = GroupMO.fetchRequest()
//        let sortDescriptor = NSSortDescriptor(key: "groupName", ascending: true)
//        fetchRequest.sortDescriptors = [sortDescriptor]
//        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//            let context = appDelegate.persistentContainer.viewContext
//            fetchResultController = NSFetchedResultsController(fetchRequest:
//                fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil,
//                              cacheName: nil)
//            fetchResultController.delegate = self
//            do {
//                try fetchResultController.performFetch()
//                if let fetchedObjects = fetchResultController.fetchedObjects {
//                    groups = fetchedObjects
//                }
//            } catch {
//                print(error)
//            }
//        }
        groupNetwork.loadGroups(token: Account.shared.token)
        { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let groups):
                self.groups = groups
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: SearchBar
    private func filterGroups (with text: String) {
        filteredGroups = groups.filter{ group in
            return group.groupName.lowercased().contains(text.lowercased())
        }
        
        tableView.reloadData()
    }
}

extension RecommendedGroupsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupCell.reuseId, for: indexPath) as? GroupCell else { fatalError("Cell cannot be dequeued")}
        
//        cell.groupnameLabel.text = groups[indexPath.row].groupName
//        cell.groupImage.image = UIImage(named: groups[indexPath.row].groupImageName!)
        
        let group = groups[indexPath.row]
        cell.configure(with: group)
        return cell        
    }
    //MARK: - Deleting group from CoreData
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
//        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//            let context = appDelegate.persistentContainer.viewContext
//            let groupToDelete = self.fetchResultController.object(at:
//                indexPath)
//            context.delete(groupToDelete)
//            
//            groups.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            
//            appDelegate.saveContext()
//        }
    }
}

extension RecommendedGroupsController: UITableViewDelegate {
    
}

//MARK: SearchBar
extension RecommendedGroupsController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredGroups = groups
            
            
            
            tableView.reloadData()
            return
        }
        filterGroups(with: searchText)
        //MARK: - Request - search groups
        let token = Account.shared.token
        NetworkingService().loadSearchGroups(token: token, q: searchText)
       
    }
    
}



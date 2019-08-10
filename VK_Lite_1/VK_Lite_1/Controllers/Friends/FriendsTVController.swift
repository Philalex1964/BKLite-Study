//
//  FriendsTVController.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 07.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

class FriendsTVController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    private var friends: [Friend] = []
    var friendName = ""
    var friendImage = UIImage()
    var firstLetterSectionTitle = [String]()
    var friendDictionary = [String : [Friend]]()
    
    var searchFriends = [Friend]()
    var searching = false
    
    private var userNetwork = UserNetwork()
    private var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchFriends = friends
        NetworkingService().loadFriends(token: Account.shared.token)
        userNetwork.loadUsers(token: Account.shared.token)
        { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                self.users = users
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sortFriends()
        
    }
    
    private func sortFriends() {
        
        firstLetterSectionTitle = []
        friendDictionary = [:]
        
        for friend in searchFriends {
            let friendNameKey = String(friend.friendName.prefix(1))
            if var friendValue = friendDictionary[friendNameKey] {
                friendValue.append(friend)
                friendDictionary[friendNameKey] = friendValue
            } else {
                friendDictionary[friendNameKey] = [friend]
            }
        }
        
        firstLetterSectionTitle = [String](friendDictionary.keys)
        firstLetterSectionTitle = firstLetterSectionTitle.sorted(by: {$0 < $1})
    }
    
    // MARK: function for searchBar
    private func filterFriends (with text: String) {
        searchFriends = friends.filter { friend in
            return friend.friendName.lowercased().contains(text.lowercased())
        }
        sortFriends()
        tableView.reloadData()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if searching {
//            return searchFriends.count
//        } else {
//            let friendNameKey = firstLetterSectionTitle[section]
//            if let friendValues = friendDictionary[friendNameKey] {
//            return friendValues.count
//            }
//        }
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.reuseId, for: indexPath) as? FriendCell else { fatalError("Cell cannot be dequeued")}
//        if searching {
//            cell.friendnameLabel.text = searchFriends[indexPath.row].friendName
//            cell.friendphotoImage.image = UIImage(named: searchFriends[indexPath.row].friendImageName)
//
//        } else {
//            let friendNameKey = firstLetterSectionTitle[indexPath.section]
//            if let friendValues = friendDictionary[friendNameKey] {
//                cell.friendnameLabel.text = friendValues[indexPath.row].friendName
//                cell.friendphotoImage.image = UIImage(named: friendValues[indexPath.row].friendImageName)
//            }
//        }
        
        let user = users[indexPath.row]
        cell.configure(with: user)
        return cell
    }
    
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if searching {
//            return nil
//        }
//            return firstLetterSectionTitle[section]
//    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        if searching {
            return nil
        } else {
            return firstLetterSectionTitle
        }
    }
  
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Photo"{
            let photoVC = segue.destination as! PhotosOfFriendsCVController
            let indexPath = tableView.indexPathForSelectedRow
            if searching {
                friendName = searchFriends[indexPath!.row].friendName
                friendImage = UIImage(named: searchFriends[indexPath!.row].friendImageName)!
            } else {
                let friendNameKey = firstLetterSectionTitle[indexPath!.section]
                if let friendValues = friendDictionary[friendNameKey] {
                    friendName = friendValues[indexPath!.row].friendName
                    friendImage = UIImage(named: friendValues[indexPath!.row].friendImageName)!
                }
            }
            photoVC.friendImage = friendImage
            photoVC.friendName = friendName
        }
    }

    
    @objc private func keyboardWasHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        
        tableView.contentInset = contentInsets
    }
    
    @objc private func hideKeyboard() {
        tableView.endEditing(true)
    }
}

extension FriendsTVController: UISearchBarDelegate {
    func searchBar (_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchFriends = friends
            sortFriends()
            tableView.reloadData()
            return
        }
        filterFriends(with: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        searchFriends = friends
        sortFriends()
        hideKeyboard()
        tableView.reloadData()
    }
    
}


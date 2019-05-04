//
//  PhotosOfFriendsCVController.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 07.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

class PhotosOfFriendsCVController: UICollectionViewController {

    public var friendName = ""
    
    public var friendImageName = ""
    
    public var friendImage: UIImage?
  
    var friends: [Friend] = []
//        Friend(friendName: "Alexey", friendGender: .male, groupMemberNumber: 1, friendImageName: "Alexey", friendImage: UIImage(named: "Alexey")),
//        Friend(friendName: "Anton", friendGender: .male, groupMemberNumber: 2, friendImageName: "Anton", friendImage: UIImage(named: "Anton")),
//        Friend(friendName: "Dmitry", friendGender: .male, groupMemberNumber: 3, friendImageName: "Dmitry", friendImage: UIImage(named: "Dmitry")),
//        Friend(friendName: "Igor", friendGender: .male, groupMemberNumber: 4, friendImageName: "Igor", friendImage: UIImage(named: "Igor")),
//        Friend(friendName: "Uliana", friendGender: .female, groupMemberNumber: 5, friendImageName: "Uliana", friendImage: UIImage(named: "Uliana"))
//    ]
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = friendName
        
        
    }

    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as? PhotoCell else { fatalError()}
        cell.likeControl.addTarget(self, action: #selector(cellLikePressed(_:)), for: .valueChanged)
        cell.photoImageView.image = friendImage
        
        return cell
    }
    
    //MARK _ Private
    @objc func cellLikePressed(_ sender: LikeControl) {
        
        
        print("The cell liked status set to: \(sender.isLiked)")
    }
}

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
        
        return cell
    }
    
    //MARK _ Private
    @objc func cellLikePressed(_ sender: LikeControl) {
        
        
        print("The cell liked status set to: \(sender.isLiked)")
    }
}

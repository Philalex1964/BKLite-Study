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
    
    //MARK:Animator
    private let transitionAnimator = Animator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = friendName
    }

    //MARK:
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
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


//MARK: Transition protocol
extension PhotosOfFriendsCVController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transitionAnimator
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transitionAnimator
    }
}

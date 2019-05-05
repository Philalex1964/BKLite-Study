//
//  FullPhotoController.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 05.05.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

private let reuseIdentifier = FullPhotoCell.reuseId

class FullPhotoController: UICollectionViewController {
    
    public var fullPhotoImage: UIImage?
    
    private var friends: [Friend] = [
        Friend(friendName: "Alexey", friendGender: .male, groupMemberNumber: 1, friendImageName: "Alexey", friendImage: UIImage(named: "Alexey")),
        Friend(friendName: "Anton", friendGender: .male, groupMemberNumber: 2, friendImageName: "Anton", friendImage: UIImage(named: "Anton")),
        Friend(friendName: "Dmitry", friendGender: .male, groupMemberNumber: 3, friendImageName: "Dmitry", friendImage: UIImage(named: "Dmitry")),
        Friend(friendName: "Igor", friendGender: .male, groupMemberNumber: 4, friendImageName: "Igor", friendImage: UIImage(named: "Igor")),
        Friend(friendName: "Uliana", friendGender: .female, groupMemberNumber: 5, friendImageName: "Uliana", friendImage: UIImage(named: "Uliana"))
    ]
    let fullPhotoImageNames = ["Alexey", "Anton", "Dmitry", "Igor", "Uliana"]
    var currentImage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
//        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
//        self.view.addGestureRecognizer(swipeRight)
//
//        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
//        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
//        self.view.addGestureRecognizer(swipeLeft)
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
//
//        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
//
//
//            switch swipeGesture.direction {
//            case UISwipeGestureRecognizer.Direction.left:
//                if currentImage == fullPhotoImageNames.count - 1 {
//                    currentImage = 0
//
//                }else{
//                    currentImage += 1
//                }
//                fullPhotoImage.image = UIImage(named: fullPhotoImageNames[currentImage])
//
//            case UISwipeGestureRecognizer.Direction.right:
//                if currentImage == 0 {
//                    currentImage = fullPhotoImageNames.count - 1
//                }else{
//                    currentImage -= 1
//                }
//                fullPhotoImage.image = UIImage(named: fullPhotoImageNames[currentImage])
//            default:
//                break
//            }
//        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FullPhotoCell.reuseId, for: indexPath) as? FullPhotoCell else { fatalError()}

        cell.fullPhotoImage.image = UIImage(named: friends[indexPath.row].friendImageName)
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

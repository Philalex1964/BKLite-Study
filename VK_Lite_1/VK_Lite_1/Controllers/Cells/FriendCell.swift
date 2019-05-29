//
//  FriendCell.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 09.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit
import Kingfisher

class FriendCell: UITableViewCell {
    
    static let reuseId = "FriendCell"
  
    @IBOutlet weak var friendphotoImage: UIImageView!
    
    @IBOutlet weak var friendnameLabel: UILabel!
    
    @IBOutlet weak var shadowView: ShadowView!
    
    public func configure(with user: User) {
        let friendName = String(user.firstName + " " +  user.lastName)
        friendnameLabel.text = friendName
        
        let photoUrlString = user.photo
        friendphotoImage.kf.setImage(with: URL(string: photoUrlString))
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}



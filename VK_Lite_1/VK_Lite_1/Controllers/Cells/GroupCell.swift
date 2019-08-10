//
//  GroupCell.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 09.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit
import Kingfisher

class GroupCell: UITableViewCell {

    static let reuseId = "GroupCell"
    
    @IBOutlet weak var groupnameLabel: UILabel!
    @IBOutlet weak var groupImage: UIImageView!
    
    public func configure(with group: Group) {
        let groupName = String(group.groupName)
        groupnameLabel.text = groupName
        
        let photoUrlString = group.photo
        groupImage.kf.setImage(with: URL(string: photoUrlString))
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
}

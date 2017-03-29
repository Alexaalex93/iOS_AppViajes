//
//  DestinosCollectionViewCell.swift
//  AppViajes
//
//  Created by cice on 29/3/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class DestinosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ciudadLabel: UILabel!
    @IBOutlet weak var paisLabel: UILabel!
    @IBOutlet weak var diasLabel: UILabel!
    @IBOutlet weak var precioLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    var isLiked: Bool = false {
        didSet{
            if isLiked {
                likeButton.setImage(UIImage(named:"heartfull"), for: .normal)
            } else {
                likeButton.setImage(UIImage(named: "heart"), for: .normal)
            }
        }
    }
}

//
//  BannerCollectionViewCell.swift
//  AppleWebViewApp
//
//  Created by User on 23/03/25.


import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var BannerImageView: UIImageView!
    
    @IBOutlet weak var UserNameLabel: UILabel!
    
    override func layoutSubviews() {
           super.layoutSubviews()
        self.layoutIfNeeded()
        BannerImageView.layer.cornerRadius = BannerImageView.frame.size.width / 2
        BannerImageView.clipsToBounds = true
        
       }
    
}

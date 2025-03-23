//
//  UserProfileCollectionViewCell.swift
//  AppleWebViewApp
//
//  Created by User on 23/03/25.
//

import UIKit

class UserProfileCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var imgView: UIImageView!
   
    override func awakeFromNib() {
        
           super.awakeFromNib()
           imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
       }
    
    override func layoutSubviews() {
        
            super.layoutSubviews()
        DispatchQueue.main.async {
                    self.imgView.layer.cornerRadius = self.imgView.frame.width / 2
                }
        }


}

//
//  SideMenuTableViewCell.swift
//  AppleWebViewApp
//
//  Created by User on 22/03/25.
//

import UIKit

class SideMenuTableViewCell: UICollectionViewCell {
   
    @IBOutlet weak var sideLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sideLabel.layer.cornerRadius = 10
        sideLabel.layer.masksToBounds = true
    }

   

}

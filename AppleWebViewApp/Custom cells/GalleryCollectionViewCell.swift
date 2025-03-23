//
//  GalleryCollectionViewCell.swift
//  AppleWebViewApp
//
//  Created by User on 23/03/25.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var GalleryImage: UIImageView!
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var clickButton: UIButton!
    override func layoutSubviews() {
        
           super.layoutSubviews()
        self.layoutIfNeeded()
        GalleryImage.layer.cornerRadius = GalleryImage.frame.size.width / 2
        GalleryImage.clipsToBounds = true
        
       }
    
    @IBAction func didTappClickButton(_ sender: Any) {
        
        print("Click button clicked.... ")
    }
    
    
    
}

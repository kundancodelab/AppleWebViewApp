//
//  BannerViewController.swift
//  AppleWebViewApp
//
//  Created by User on 23/03/25.
//

import UIKit

class BannerViewController: UIViewController {
    @IBOutlet weak var BannerCollView: UICollectionView!
    
    @IBOutlet weak var GallaryCollView: UICollectionView!
    
    
    var imageArr = [ "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download","download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download","download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download","download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download","download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download", "download"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        customizeCollectionView(collectionView: BannerCollView)
        customizeCollectionView(collectionView: GallaryCollView)
        
        GallaryCollView.register(UINib(nibName: "GallCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        BannerCollView.register(UINib(nibName: "UserProfileCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UserCell")
    }
    
    func customizeCollectionView(collectionView: UICollectionView) {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        
        if collectionView == GallaryCollView {
            layout.scrollDirection = .vertical
        }else{
            layout.scrollDirection = .horizontal
        }
       
        collectionView.collectionViewLayout = layout
        
    }


  

}

extension BannerViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imageArr.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var Maincell = UICollectionViewCell()
        switch collectionView {
        case BannerCollView:
            let cell = BannerCollView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! UserProfileCollectionViewCell
           // cell.BannerImageView.image = UIImage(named: "\(imageArr[indexPath.row])")
           // cell.UserNameLabel.text = "kundan baba"
           
//            cell.BannerImageView.layer.cornerRadius = cell.BannerImageView.frame.size.width / 2
//            cell.BannerImageView.clipsToBounds = true
            
            
            Maincell = cell
            
            
        case GallaryCollView:
            
            let cell = GallaryCollView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GallCollectionViewCell
           // cell.GalleryImage.image = UIImage(named: "\(imageArr[indexPath.row])")
           
//            cell.GalleryImage.layer.cornerRadius = cell.GalleryImage.frame.size.width / 2
//            cell.GalleryImage.clipsToBounds = true
            
            
            Maincell = cell
            
        default:
            print(" Fatal eror collection view not found ! ")
            return Maincell
        }
        
      
        
      return Maincell
        
    }
    
    
}


extension BannerViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == BannerCollView {
//            let collwidth = collectionView.bounds.width
//            return CGSize(width:  collwidth / 3  - 5  , height: collwidth / 3   )
//
            let itemsPerRow: CGFloat = 3
            let spacing: CGFloat = 20
            let totalSpacing = (itemsPerRow - 1) * spacing // Total space between cells

            let cellWidth = (collectionView.bounds.width - totalSpacing) / itemsPerRow
            print("total width : \(collectionView.bounds.width)")
            print("total height : \(collectionView.bounds.width)")
            print("cell width: \(cellWidth)")
            print("cell height: \(cellWidth)")
            return CGSize(width: cellWidth, height: cellWidth )
            //  I have increased + 38 for label height .

        }
        else {
            
            let width = collectionView.bounds.width / 3 - 10 // Adjust for 2 columns with spacing
            let height = width + 20 // Image height + label height + padding
            
            return CGSize(width: width, height: height)
          
            
        }
        
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == BannerCollView {
            
            // MARK: Important tips UICollectionView .
            // when UICollectionView's scroll is horizentally lineSpacing starts working as ItemSpacing remeber this point
            return  20
            
        }else {
            
            return 10
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        switch collectionView {
        case GallaryCollView:
            return 8
        default:
            //minimumInteritemSpacingForSectionAt this is actually does work for uicollectionView's scroll direction is horizental.
            return 0
        }
        
    }
  
}


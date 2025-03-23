//
//  SecondViewController.swift
//  AppleWebViewApp
//
//  Created by User on 23/03/25.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var collView: UICollectionView!
    
    
    var arr = ["Indai", "USA", "UK", "China", "Japan", "Canada", "Australia", "Africa", "Russia", "Brazil"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collView.delegate = self
        collView.dataSource = self
        
        if let layout = collView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }

}

extension SecondViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "CustomeCollectionViewCell", for: indexPath) as! CustomeCollectionViewCell
        cell.collLabel.text = arr[indexPath.row]
        
        return cell
        
    }
}


extension SecondViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collWidth = collectionView.bounds.width
        let collHeight = collectionView.bounds.height
        let numberofItems : CGFloat = 5
        let spacing:CGFloat = 10
        
        let totalspacing: CGFloat = (numberofItems - 1) * spacing
        
        let cellwidth = (collWidth - totalspacing) / numberofItems
        
        print(" collectionView width \(collWidth)")
        print(" collectionView height \(collHeight)")
        print(" cell width \(cellwidth)")
        
        return CGSize(width: cellwidth, height: 80)
        
    }
    
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        
//        return 0
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
}


    

import UIKit
import WebKit

class MainViewController: UIViewController {

    // MARK: - Outlets
   
    @IBOutlet weak var sliderCollView: UICollectionView!
    
    @IBOutlet weak var webView: WKWebView!
  
    // Loader (Activity Indicator)
    var activityIndicator: UIActivityIndicatorView!
 

    let sideBarItems = sideMenuDataModel()
    let webViewModel = AppleWebViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        customizeCollectionView()
        setupActivityIndicator()
        loadURLPage(url: "https://www.apple.com")
        
        if let layout = sliderCollView.collectionViewLayout as? UICollectionViewFlowLayout {
               layout.scrollDirection = .horizontal
           }
    }

    func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
    }

    func loadURLPage(url: String) {
        guard let myURL = URL(string: url) else { return }
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }

    func customizeCollectionView() {
        
        sliderCollView.delegate = self
        sliderCollView.dataSource = self
      
       
    }
}

// MARK: - UICollectionView Delegate & DataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sideBarItems.sideBarItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SideCollectionViewCell", for: indexPath) as! SideMenuTableViewCell
        cell.sideLabel.text = sideBarItems.sideBarItems[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedKey = Array(webViewModel.webLinks.keys)[indexPath.row]
        if let selectedURL = webViewModel.getURL(for: selectedKey) {
            loadURLPage(url: selectedURL.absoluteString)
            activityIndicator.startAnimating()
        }
    }
    
    
}

// MARK: UICollectionFlowDelegate

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionHeight = collectionView.bounds.height
                let numberOfItems: CGFloat = 4
                let spacing: CGFloat = 4
                let totalSpacing = (numberOfItems - 1) * spacing
                let cellWidth = (collectionView.bounds.width - totalSpacing) / numberOfItems
                
                // Debug prints
                print("Collection View Width: \(collectionView.bounds.width)")
                print("Collection View Height: \(collectionHeight)")
                print("Cell Width: \(cellWidth)")
                
                return CGSize(width: cellWidth, height: collectionHeight)
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 3
//        
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10) // Add some padding to the sides
//    }
    
   
}



// MARK: - WKWebView Navigation Delegate Methods
extension MainViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
}

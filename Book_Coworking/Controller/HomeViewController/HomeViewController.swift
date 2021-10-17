//
//  HomeViewController.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/3/21.
//

import UIKit
import FirebaseFirestore
import FirebaseStorage

class HomeViewController: UIViewController {
    
    @IBOutlet weak var cardCollection: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageAvata: UIImageView!
    @IBOutlet weak var searchView: UISearchBar!
    @IBOutlet weak var collectionViewSlideShow: UICollectionView!
    
    let imageSlideShows = ["slide1", "slide2", "slide3","slide4"]
    var scrollImageTimer: Timer!
    var count = 0
    let coworkings:[Coworking] = coworkingsList
    var pendingWorkItem: DispatchWorkItem?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpViewHeader()
        config()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = true
    }
    
    func setUpViewHeader() {
        loadImageAvata()
        imageAvata.layer.cornerRadius = imageAvata.frame.height/2
    }
    
    func config() {
        setUpCollectionView()
        let tabSearch = UITapGestureRecognizer(target: self, action: #selector(didTabSearchView))
        searchView.searchTextField.addGestureRecognizer(tabSearch)
    }
    
    func loadImageAvata() {

        createDocument().getDocument { snapshot, error in
            guard let data = snapshot?.data() as? [String : String] else {
                print("Data was empty")
                return
            }
            let ref = data["profile_photo"]
            
            self.downloadUrlForProfilePicture(path: ref ?? "") { url in
                guard let url = url else {
                    return
                }
                let task = URLSession.shared.dataTask(with: url) { data, _, _ in
                    guard let data_image = data else {
                        return
                    }
                    DispatchQueue.main.async {
                        self.imageAvata.image = UIImage(data: data_image)
                    }
                }
                task.resume()
            }
        }
    }
    
    public func downloadUrlForProfilePicture(
        path: String,
        completion: @escaping (URL?) -> Void
    ) {
        Storage.storage().reference(withPath: path)
            .downloadURL { url, _ in
                completion(url)
            }
    }
    
    //MARK: Slide Show
    
    func setUpCollectionView() {
        
        collectionViewSlideShow.delegate = self
        collectionViewSlideShow.dataSource = self
        collectionViewSlideShow.isPagingEnabled = false
        
        cardCollection.delegate = self
        cardCollection.dataSource = self
        
        collectionViewSlideShow.register(UINib(nibName: "SlideCell", bundle: nil), forCellWithReuseIdentifier: "SlideCell")
        cardCollection.register(UINib(nibName: "CardCell", bundle: nil), forCellWithReuseIdentifier: "CardCell")
        
        setPageControlImage()
        scrollImageTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(setTimer), userInfo: nil, repeats: true)
    }
    
    func setPageControlImage() {
        pageControl.numberOfPages = imageSlideShows.count
        pageControl.currentPage = 0
    }
    
    @objc func setTimer() {
        
        if count < imageSlideShows.count {
            let index = IndexPath.init(item: count, section: 0)
            collectionViewSlideShow.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = count
            count += 1
        }
        else {
            count = 0
            let index = IndexPath.init(item: count, section: 0)
            collectionViewSlideShow.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = count
        }
    }
    
    @objc func didTabSearchView() {
        let vc = SearchBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: Extension

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewSlideShow {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideCell", for: indexPath) as? SlideCell
            cell?.imgSlide.image = UIImage(named: "\(imageSlideShows[indexPath.row])")
            return cell!
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as? CardCell
            cell?.imgDes.image = UIImage(named: coworkings[indexPath.row].images[0])
            cell?.lbNameCoworing.text = coworkings[indexPath.row].name
            cell?.lbAddress.text = coworkings[indexPath.row].address
            cell?.lbRate.text = "\(coworkings[indexPath.row].rate)"
            return cell!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewSlideShow {
            return imageSlideShows.count
        }
        else {
            return coworkings.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == cardCollection {
            let vc = DetailCoworkingViewController()
            vc.index = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewSlideShow {
            return CGSize(width: collectionViewSlideShow.frame.size.width, height: collectionViewSlideShow.frame.size.height)
        }
        else {
            return CGSize(width: cardCollection.frame.size.width, height: cardCollection.frame.size.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView ==  cardCollection {
            return 20
        }
        else {
            return 0
        }
    }
}



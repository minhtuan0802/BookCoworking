//
//  DetailCoworkingViewController.swift
//  Book_Coworking
//
//  Created by Trang Huyền on 9/14/21.
//

import UIKit
import FirebaseFirestore
import Cosmos
import MapKit

class DetailCoworkingViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tabelReview: UITableView!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var imageColletionDetail: UICollectionView!
    
    var index: Int
    
    init() {
        self.index = 0
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let button = UIButton().button(text: "Book Now")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configColletionView()
        view.addSubview(button)
        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.tintColor = UIColor().mainColor()
        setupLayout()
        configData()
        button.addTarget(self, action: #selector(didTapButtonBook), for: .touchUpInside)
        navigationController?.isNavigationBarHidden = false
        configTableReview()
        configMapView()
    }
    
    func configColletionView() {
        imageColletionDetail.delegate = self
        imageColletionDetail.dataSource = self
        imageColletionDetail.register(UINib(nibName: "ImageCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionCell")
    }
    
    func configTableReview() {
        tabelReview.delegate = self
        tabelReview.dataSource = self
        tabelReview.register(UINib(nibName: "ReviewCell", bundle: nil), forCellReuseIdentifier: "ReviewCell")
        tabelReview.tableFooterView = UIView()
    }
    
    func configData() {
        lbAddress.text = coworkingsList[index].address
        lbDescription.text = coworkingsList[index].description
        lbDescription.numberOfLines = 0
        lbPrice.text = "\(coworkingsList[index].price)đ /Hour"
        lbPrice.textColor = UIColor().mainColor()
        
        loadReview()
    }
    
    //MARK: - Setup mapview
    
    func configMapView() {
        let initialLocation = CLLocation(latitude: coworkingsList[index].latitude, longitude: coworkingsList[index].longtitude)
        mapView.centerToLocation(initialLocation)
        mapView.addAnnotation(Artwork(
            title: coworkingsList[index].name,
            
            coordinate: CLLocationCoordinate2D(latitude: coworkingsList[index].latitude, longitude: coworkingsList[index].longtitude)
        ))
        
    }
    
    func loadReview() {
        let db = Firestore.firestore()
        let reviewCollection = db.collection("Review")
        
        reviewCollection.whereField("Coworking", isEqualTo: coworkingsList[self.index].name)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    reviews = querySnapshot?.documents.map({Review.init(snapShot: $0)})
                    self.tabelReview.reloadData()
                }
            }
    }
    
    func setupLayout(){
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    @objc func didTapButtonBook(){
        let vc = BookViewController()
        vc.index = index
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tabViewAll(_ sender: Any) {
        let vc = ShowAllReviewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension DetailCoworkingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coworkingsList[index].images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionCell", for: indexPath) as? ImageCollectionCell
        cell?.imgSlide.image = UIImage(named: "\(coworkingsList[index].images[indexPath.row])")
        return cell!
    }
}

extension DetailCoworkingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: imageColletionDetail.frame.size.width*0.6, height: imageColletionDetail.frame.size.height)
    }
    
}

extension DetailCoworkingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelReview.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell
        cell.cosmosView.rating = reviews?[indexPath.row].rating ?? 3.0
        cell.lbContent.text = reviews?[indexPath.row].content
        cell.lbName.text = reviews?[indexPath.row].username
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

//MARK: - Extension MapView
private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}


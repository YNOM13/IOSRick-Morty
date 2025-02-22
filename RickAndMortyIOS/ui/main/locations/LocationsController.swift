//
//  LocationsController.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 2/22/25.
//

import UIKit

class LocationsController: BaseUserController{
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
   
    private var locations: [LocationResult] = []
    private var page: Int = 1
    private var item: PageInfo? = nil
    private var isLoading: Bool = false
    private var presenter: LocationApiPresenterProtocol?
    let bottomRefreshController = UIRefreshControl()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "LocationCell", bundle: nil), forCellWithReuseIdentifier: "locationCell")
        presenter = LocationPresenter(view: self)
        loadEpisodes(page: page)
    }
    
    func loadEpisodes(page: Int) {
        guard !isLoading else {
//            loadingIndicatorView.isHidden = false
            return
        }
        isLoading = true
//        loadingIndicatorView.isHidden = isLoading
        presenter?.loadLocations(page: page)
    }
    
    @objc func refreshBottom() {
        presenter?.loadLocations(page: page)
    }
    
    override func displayLocation(_ locations: [LocationResult], _ item: PageInfo) {
        self.locations = locations
        self.item = item
        isLoading = false
        collectionView.reloadData()
    }
}

extension LocationsController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath as IndexPath) as! LocationCell
        cell.setData(location: locations[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedLocation = locations[indexPath.row]
        let userInfoVC = UIStoryboard(name: "Locations", bundle: nil).instantiateViewController(withIdentifier: "locationInfo") as! LocationInfoController
        userInfoVC.location = selectedLocation
        userInfoVC.shift.enable()
        
        present(userInfoVC, animated: true, completion: nil)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if page <= item?.pages ?? 0 {
            loadEpisodes(page: page)
            page += 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath){
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 16), height: 100)
    }
}

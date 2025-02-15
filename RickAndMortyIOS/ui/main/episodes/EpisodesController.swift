//
//  EpisodesController.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 1/21/25.
//

import UIKit

class EpisodesController: BaseUserController{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var loadingIndicatorView: UIView!
  
    private var episodes: [EpisodeResult] = []
    private var page: Int = 1
    private var item: PageInfo? = nil
    private var isLoading: Bool = false
    private var presenter: EpisodeApiPresenterProtocol?
    let bottomRefreshController = UIRefreshControl()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "EpisodeCell", bundle: nil), forCellWithReuseIdentifier: "episodeCell")
        presenter = EpisodePresenter(view: self)
        loadEpisodes(page: page)
    }
    
    func loadEpisodes(page: Int) {
        guard !isLoading else {
//            loadingIndicatorView.isHidden = false
            return
        }
        isLoading = true
//        loadingIndicatorView.isHidden = isLoading
        presenter?.loadEpisodes(page: page)
    }
    
    @objc func refreshBottom() {
        presenter?.loadEpisodes(page: page)
    }
    
    override func displayEpisodes(_ episodes: [EpisodeResult], _ item: PageInfo) {
        self.episodes = episodes
        self.item = item
        isLoading = false
        collectionView.reloadData()
    }
}

extension EpisodesController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "episodeCell", for: indexPath as IndexPath) as! EpisodeCell
        cell.setData(item: episodes[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedEpisode = episodes[indexPath.row]
        let userInfoVC = UIStoryboard(name: "Episodes", bundle: nil).instantiateViewController(withIdentifier: "episodeInfo") as! EpisodeInfoController
        userInfoVC.episode = selectedEpisode
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
        return CGSize(width: (collectionView.frame.width - 16), height: 50)
    }
}

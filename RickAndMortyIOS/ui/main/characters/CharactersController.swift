//
//  CharactersController.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 12/4/24.
//

import UIKit
import ShiftTransitions

class CharactersController: BaseUserController{
    @IBOutlet weak var charactersCollectionView: UICollectionView!
    @IBOutlet weak var loadingIndicatorView: UIView!
    @IBOutlet weak var headerView: UIView!
    
    private var characters: [CharacterResult] = []
    private var page: Int = 1
    private var item: PageInfo? = nil
    private var isLoading: Bool = false
    private var presenter: CharacterApiPresenterProtocol?
    let bottomRefreshController = UIRefreshControl()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersCollectionView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellWithReuseIdentifier: "characterCell")
        presenter = CharacterPresenter(view: self)
        loadCharacters(page: page)
        
        headerView.transitionId = "ok"
    }
    
    func loadCharacters(page: Int) {
        guard !isLoading else {
//            loadingIndicatorView.isHidden = false
            return
        }
        isLoading = true
//        loadingIndicatorView.isHidden = isLoading
        presenter?.loadCharacters(page: page)
    }
    
    @objc func refreshBottom() {
        presenter?.loadCharacters(page: page)
    }
    
    override func displayCharacters(_ characters: [CharacterResult], _ item: PageInfo) {
        self.characters = characters
        self.item = item
        isLoading = false
        charactersCollectionView.reloadData()
    }
}

extension CharactersController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath as IndexPath) as! CharacterCell
        cell.setData(item: characters[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedUser = characters[indexPath.row]
        let userInfoVC = UIStoryboard(name: "Characters", bundle: nil).instantiateViewController(withIdentifier: "characterInfo") as! CharacterInfoController
        userInfoVC.characterInfo = selectedUser
        userInfoVC.shift.enable()
        
        present(userInfoVC, animated: true, completion: nil)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if page <= item?.pages ?? 0 {
            page += 1
            loadCharacters(page: page)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath){
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 16) / 2, height: (collectionView.frame.width / 2) + 20)
    }
}


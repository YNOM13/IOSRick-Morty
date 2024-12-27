//
//  CharactersController.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 12/4/24.
//

import UIKit

class CharactersController: BaseController, CharacterApiView{
    @IBOutlet weak var charactersCollectionView: UICollectionView!
    
    private var presenter: CharacterApiPresenterProtocol?
    private var characters: Array<CharacterResult> = Array()
    private var isLoading = false
    private let footerView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.white)

    override func viewDidLoad() {
        super.viewDidLoad()
        charactersCollectionView.register(UINib(nibName: "CharacterCell", bundle: nil), forCellWithReuseIdentifier: "characterCell")
        

        presenter = CharacterPresenter(view: self)
        presenter?.reloadPage()
    }
    
    
    func displayUsers(_ users: [CharacterResult], _ item: CharacterInfo) {
        self.characters = users
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
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        presenter?.loadNextPage()
    }
    
//        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//            let selectedUser = characters[indexPath.row]
//            let userInfoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "userInfo") as! UserInfoController
//            userInfoVC.userInfo = selectedUser
//            userInfoVC.modalPresentationStyle = .fullScreen
//            present(userInfoVC, animated: true)
//        }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath)
            footer.addSubview(footerView)
            footerView.frame = CGRect(x: 0, y: 0, width: collectionView.bounds.width, height: 50)
            return footer
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath){
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 68)
    }
}

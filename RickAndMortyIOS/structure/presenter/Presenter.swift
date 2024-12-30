//
//  Presenter.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 12/12/24.
//

import Alamofire
import ObjectMapper

protocol CharacterApiPresenterProtocol: AnyObject {
    func loadCharacters(page: Int)
}

protocol CharacterApiView: AnyObject {
    func displayUsers(_ users: [CharacterResult], _ item: CharacterInfo)
    func showError(_ message: String)
}

class CharacterPresenter: CharacterApiPresenterProtocol {
    weak var view: CharacterApiView?
    private var users: [CharacterResult] = []

    init(view: CharacterApiView) {
        self.view = view
    }

    func loadCharacters(page: Int) {
        let url = "https://rickandmortyapi.com/api/character/?page=\(page)"
        
        AF.request(url).validate().responseData { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let data):
                if let character = try? Mapper<Character>().map(JSONString: String(data: data, encoding: .utf8)!) {
                    self.users.append(contentsOf: character.characterResult ?? [])
                    
                    if let info = character.characterInfo {
                        self.view?.displayUsers(self.users, info)
                    }
                }
            case .failure:
                break
            }
        }
    }
}

//
//  Presenter.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 12/12/24.
//

import Alamofire
import ObjectMapper

protocol CharacterApiPresenterProtocol: AnyObject {
    func reloadPage()
    func loadNextPage()
}

protocol CharacterApiView: AnyObject {
    func displayUsers(_ users: [CharacterResult], _ item: CharacterInfo)
    func showError(_ message: String)
}

class CharacterPresenter: CharacterApiPresenterProtocol {
    weak var view: CharacterApiView?
    private var users: [CharacterResult] = []
    private var info: CharacterInfo? = nil
    private var page: Int = 1
    
    init(view: CharacterApiView) {
        self.view = view
    }
    
    func reloadPage() {
        page = 1
        users = []
        fetchUsers()
    }
    
    func loadNextPage() {
        page += 1
        fetchUsers()
    }
    
    func fetchUsers() {
        let url = "https://rickandmortyapi.com/api/character/?page=\(page)"

        AF.request(url)
            .validate()
            .responseData { [weak self] response in
                guard let self = self else { return }
                switch response.result {
                case .success(let data):
                    if let character = try? Mapper<Character>().map(JSONString: String(data: data, encoding: .utf8)!) {
                        
                        self.info = character.characterInfo ?? CharacterInfo(map: Map(mappingType: .fromJSON, JSON: [:]))!
                        self.users.append(contentsOf: character.characterResult ?? [])
                        if let info = self.info{
                            self.view?.displayUsers(self.users, info)
                        }
                    } else {
                        self.view?.showError("Failed to parse user data.")
                    }
                case .failure(let error):
                    self.view?.showError("Request failed: \(error.localizedDescription)")
                }
            }
    }
}

//if let info = character.characterInfo {
//    print("Info: \(info)")
//    print("Total characters: \(info.count ?? 0)")
//}
//
//if let results = character.characterResult {
//    print("Results: \(results)")
//    for result in results {
//        print("Character Name: \(result.name ?? "Unknown")")
//    }
//}

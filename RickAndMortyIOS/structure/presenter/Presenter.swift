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
    func displayUsers(_ users: [CharacterResult], _ item: PageInfo)
    func showError(_ message: String)
}

class CharacterPresenter: CharacterApiPresenterProtocol {
    weak var view: CharacterApiView?
    private var users: [CharacterResult] = []

    init(view: CharacterApiView) {
        self.view = view
    }

    func loadCharacters(page: Int) {
        APIService.fetchCharacters(page: page) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let character):
                self.users.append(contentsOf: character.characterResult ?? [])
                
                if let info = character.characterInfo {
                    self.view?.displayUsers(self.users, info)
                }
            case .failure(let error):
                self.view?.showError(error.message)
            }
        }
    }
}

protocol EpisodeApiPresenterProtocol: AnyObject {
    func loadEpisodes(page: Int)
}

protocol EpisodeApiView: AnyObject {
    func displayEpisodes(_ episodes: [EpisodeResult], _ item: PageInfo)
    func showError(_ message: String)
}

class EpisodePresenter: EpisodeApiPresenterProtocol {
    weak var view: EpisodeApiView?
    private var episodes: [EpisodeResult] = []

    init(view: EpisodeApiView) {
        self.view = view
    }

    func loadEpisodes(page: Int) {
        APIService.fetchEpisodes(page: page) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let episode):
                self.episodes.append(contentsOf: episode.episodeResult ?? [])
                
                if let info = episode.episodeInfo {
                    self.view?.displayEpisodes(self.episodes, info)
                }
            case .failure(let error):
                self.view?.showError(error.message)
            }
        }
    }
}

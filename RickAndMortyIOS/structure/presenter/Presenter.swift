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

protocol EpisodeApiPresenterProtocol: AnyObject {
    func loadEpisodes(page: Int)
}

protocol ApiView: AnyObject {
    func displayCharacters(_ characters: [CharacterResult], _ item: PageInfo)
    func showError(_ message: String)
    func displayEpisodes(_ episodes: [EpisodeResult], _ item: PageInfo)
}

class CharacterPresenter: CharacterApiPresenterProtocol {
    weak var view: ApiView?
    private var characters: [CharacterResult] = []

    init(view: ApiView) {
        self.view = view
    }

    func loadCharacters(page: Int) {
        APIService.fetchCharacters(page: page) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let character):
                self.characters.append(contentsOf: character.characterResult ?? [])
                
                if let info = character.characterInfo {
                    self.view?.displayCharacters(self.characters, info)
                }
            case .failure(let error):
                self.view?.showError(error.message)
            }
        }
    }
}

class EpisodePresenter: EpisodeApiPresenterProtocol {
    weak var view: ApiView?
    private var episodes: [EpisodeResult] = []

    init(view: ApiView) {
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

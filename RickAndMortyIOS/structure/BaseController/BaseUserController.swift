//
//  BaseUserController.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 2/15/25.
//

import UIKit

class BaseUserController: BaseController, ApiView{

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func showError(_ message: String) {}
    func displayEpisodes(_ episodes: [EpisodeResult], _ item: PageInfo) {}
    func displayCharacters(_ characters: [CharacterResult], _ item: PageInfo) {}
    func displayLocation(_ locations: [LocationResult], _ item: PageInfo) {}
}

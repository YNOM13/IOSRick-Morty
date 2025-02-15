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
    
    func displayCharacters(_ characters: [CharacterResult], _ item: PageInfo) {}
    override func showError(_ message: String) {}
    func displayEpisodes(_ episodes: [EpisodeResult], _ item: PageInfo) {}
}

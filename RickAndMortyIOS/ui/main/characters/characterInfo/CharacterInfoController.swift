//
//  CharacterInfoController.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 12/30/24.
//

import UIKit
import Kingfisher

class CharacterInfoController: BaseController{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    var characterInfo: CharacterResult? = nil
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        nameLabel.text = characterInfo?.name ?? "error 404"
        characterImage.kf.setImage(with: URL(string: characterInfo?.imageURL ?? ""))
    }
    
}

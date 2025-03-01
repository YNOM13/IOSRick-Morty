//
//  CharacterInfoController.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 12/30/24.
//

import UIKit
import Kingfisher
import ShiftTransitions

class CharacterInfoController: BaseController{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var isAliveIndicatorView: UIView!
    @IBOutlet weak var isAlivePersonLabel: UILabel!
    @IBOutlet weak var scpeciesLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var urlOriginUrl: UILabel!
    
    var characterInfo: CharacterResult? = nil
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        nameLabel.text = characterInfo?.name ?? "error 404"
        characterImage.kf.setImage(with: URL(string: characterInfo?.imageURL ?? ""))
        characterImage.transitionId = String(characterInfo?.id ?? 0)
        nameLabel.transitionId = String(characterInfo?.id ?? 0) + "name"
        isAlivePersonLabel.text = characterInfo?.status
        
        if characterInfo?.status == StatusCharacterType.alive.rawValue{
            isAliveIndicatorView.backgroundColor = UIColor._81_FC_9_C
        }else if characterInfo?.status == StatusCharacterType.dead.rawValue{
            isAliveIndicatorView.backgroundColor = UIColor.E_55656
        }else if characterInfo?.status == StatusCharacterType.unknown.rawValue{
            isAliveIndicatorView.backgroundColor = UIColor._012121
        }else{
            isAliveIndicatorView.backgroundColor = UIColor._012121
        }
        scpeciesLabel?.text =  "Species \(characterInfo?.species ?? "None")"
        
        typeLabel?.text = characterInfo?.type != "" ? "Type \(characterInfo?.type ?? "None")" : "Type is undefined"
        originLabel?.text = "origin name \(characterInfo?.origin?.name ?? "")"
        urlOriginUrl?.text = "  url \(characterInfo?.origin?.url ?? "")"
    }
}

//
//  CharacterCell.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 12/12/24.
//

import UIKit
import Kingfisher
import ShiftTransitions

class CharacterCell: UICollectionViewCell{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    func setData(item: CharacterResult){
        nameLabel.text = item.name
        characterImage.kf.setImage(with: URL(string: item.imageURL ?? ""))
        characterImage.transitionId = String(item.id)
        nameLabel.transitionId = String(item.id) + "name"
        
        characterImage.layer.cornerRadius = 12
        characterImage.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}

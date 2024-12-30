//
//  CharacterCell.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 12/12/24.
//

import UIKit
import Kingfisher

class CharacterCell: UICollectionViewCell{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    func setData(item: CharacterResult){
        nameLabel.text = item.name
        characterImage.kf.setImage(with: URL(string: item.imageURL ?? ""))
    }
}

//
//  CharacterCell.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 12/12/24.
//

import UIKit

class CharacterCell: UICollectionViewCell{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var demensionLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    func setData(item: CharacterResult){
        nameLabel.text = item.name
    }
}

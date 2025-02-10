//
//  EpisodeCell.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 1/20/25.
//

import UIKit

class EpisodeCell: UICollectionViewCell{
    @IBOutlet weak var nameLabel: UILabel!
    
    func setDaya(item: EpisodeResult){
        nameLabel.text = item.name
    }
}

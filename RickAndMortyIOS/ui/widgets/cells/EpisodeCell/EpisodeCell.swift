//
//  EpisodeCell.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 1/20/25.
//

import UIKit

class EpisodeCell: UICollectionViewCell{
    @IBOutlet weak var nameLabel: UILabel!
    
    func setData(item: EpisodeResult){
        nameLabel.text = item.name
    }
}

//
//  LocationCell.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 2/22/25.
//

import UIKit

class LocationCell: UICollectionViewCell{
    @IBOutlet weak var locationNameLabel: UILabel!
    
    func setData(location: LocationResult){
        locationNameLabel?.text = location.name
    }
}

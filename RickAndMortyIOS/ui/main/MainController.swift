//
//  MainController.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 11/30/24.
//

import UIKit

class MainController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.tabBar.backgroundColor = UIColor(named: "CFE1FA")
    }
}


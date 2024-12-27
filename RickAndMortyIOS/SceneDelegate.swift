//
//  Sc.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 12/3/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let viewController = UIStoryboard(name: "Splash", bundle: nil).instantiateViewController(withIdentifier: "splash")
        let navigation = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = navigation
        
        self.window = window
        window.makeKeyAndVisible()
    }
}


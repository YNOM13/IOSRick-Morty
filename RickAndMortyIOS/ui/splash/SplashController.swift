//
//  SplashController.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 11/30/24.
//

import UIKit
import Lottie

class SplashController: UIViewController{
    @IBOutlet weak var animationView: LottieAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView?.animation = LottieAnimation.named("rick_drinking")
        animationView?.loopMode = .loop
        animationView?.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.openMainController()
        }
    }
    
    func openMainController(){
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        if let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main") as? MainController {
            mainVC.modalPresentationStyle = .fullScreen
            window.rootViewController = mainVC
            window.makeKeyAndVisible()
        }
    }
}

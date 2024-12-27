//
//  BaseController.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 11/30/24.
//

import UIKit

class BaseController: UIViewController{
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func showError(_ error: String = "Whoops! Something went wrong..."){
        if let myVC = UIStoryboard(name: "ErrorView", bundle: nil).instantiateViewController(withIdentifier: "errorView") as? ErrorViewController{
            myVC.errorText = error
            present(myVC, animated: true, completion: nil)
        }
    }
}

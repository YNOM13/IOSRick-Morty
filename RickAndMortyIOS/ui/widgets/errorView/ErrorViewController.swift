//
//  ErrorViewController.swift
//  RickAndMortyIOS
//
//  Created by Yaroslav on 11/30/24.
//

import UIKit

class ErrorViewController: BaseController {
    @IBOutlet weak var errorLabel: UILabel!
    
    var errorText = "Whoops! Something went wrong..."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.text = errorText
    }
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true)
    }
}

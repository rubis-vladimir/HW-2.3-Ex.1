//
//  SecondViewController.swift
//  DataTransfer
//
//  Created by Владимир Рубис on 25.05.2021.
//

import UIKit

class SecondViewController: UIViewController {

    var login: String?
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.font = UIFont(name: "AvenirNextCondensed-Bold", size: 50)
        logOutButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Bold", size: 30)
        guard let login = self.login else { return }
        helloLabel.text = "Hello, \(login)!"

    }
    
    @IBAction func logOutTapped(_ sender: UIButton) {
    }
    
}

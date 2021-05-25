//
//  ViewController.swift
//  DataTransfer
//
//  Created by Владимир Рубис on 24.05.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.font = UIFont(name: "AvenirNextCondensed-Medium", size: 20)
        password.font = UIFont(name: "AvenirNextCondensed-Medium", size: 20)
        logInButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Bold", size: 30)
        forgotUserNameButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 20)
        forgotPasswordButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 20)
        

//        NSLayoutConstraint(item: forgotStackView as Any, attribute: .bottom, relatedBy: .greaterThanOrEqual, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -200.0).isActive = true
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateScreen(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateScreen(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }

    @IBAction func logInTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    @IBAction func forgotUserNameTapped(_ sender: UIButton) {
    }
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
    }
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
        userName.text = ""
        password.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? SecondViewController else { return }
        dvc.login = userName.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
//    func registerForKeyboardNotification() {
//        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
//    }
    
//    func kbWillShow(_ notification: Notification) {
//        User
//    }
//
//    func kbWillHide() {
//
//    }
    @objc func updateScreen(notification: Notification) {

        guard let userInfo = notification.userInfo as? [String: Any],
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        
//        let sdvig = self.view.frame.height - keyboardFrame.height/2
        if notification.name == UIResponder.keyboardWillHideNotification {
            bottomConstraint.constant = 50
//            forgotStackView.centerXAnchor.constraint(equalToSystemSpacingAfter: self.view.centerXAnchor, multiplier: 1.2)
        } else {
//            NSLayoutConstraint(item: forgotStackView as Any, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -keyboardFrame.height - 20).isActive = true
//            self.view.frame.origin.y = -keyboardFrame.height/2
            bottomConstraint.constant = 50 + keyboardFrame.height
            
//            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: sdvig)
            
        }
//        if notification.name == UIResponder.keyboardWillHideNotification {
////            var verticalSpace = NSLayoutConstraint(item: superStack as Any, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: UIResponder.self, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 2)
////            NSLayoutConstraint.activate([verticalSpace])
//        } else {
//            var verticalSpace = NSLayoutConstraint(item: superStack, attribute: NSLayoutConstraint.Attribute.bottomMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: UIResponder.self, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1.0, constant: 0)
//            NSLayoutConstraint.activate([verticalSpace])
//        }
    }
}


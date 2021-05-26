//
//  ViewController.swift
//  DataTransfer
//
//  Created by Владимир Рубис on 24.05.2021.
//

import UIKit

let user = [(username: "User", password: "Password"), (username: "Vladimir", password: "1234")]

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.font = UIFont(name: "AvenirNextCondensed-BoldItalic", size: 40)
        userName.font = UIFont(name: "AvenirNextCondensed-Medium", size: 20)
        password.font = UIFont(name: "AvenirNextCondensed-Medium", size: 20)
        logInButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Bold", size: 30)
        forgotUserNameButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 20)
        forgotPasswordButton.titleLabel?.font = UIFont(name: "AvenirNextCondensed-Regular", size: 20)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateScreen(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateScreen(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        userName.delegate = self
        password.delegate = self
    }
    
    @IBAction func logInTapped(_ sender: UIButton) {
        
        guard userName.text?.isEmpty == false && password.text?.isEmpty == false
        else { return }
        if let _ = Double(userName.text!) {
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your Name", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        } else {
            for i in 0..<user.count {
                if userName.text == user[i].username && password.text == user[i].password {
                    performSegue(withIdentifier: "detailSegue", sender: nil)
                    userName.text = nil
                    password.text = nil
                    break
                }
            }
            let alert = UIAlertController(title: "Invalid login or password", message: "Please, enter correct login or password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func forgotUserNameTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Oops!", message: "Your name is User \u{1F609}", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Oops!", message: "Your password is Password \u{1F60B}", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func unwindSegueToMainScreen(segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dvc = segue.destination as? SecondViewController else { return }
        dvc.login = userName.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func updateScreen(notification: Notification) {
        
        guard let userInfo = notification.userInfo as? [String: Any],
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            bottomConstraint.constant = 50
        } else {
            bottomConstraint.constant = 40 + keyboardFrame.height
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userName:
            performSegue(withIdentifier: "detailSegue", sender: nil)
        case password:
            performSegue(withIdentifier: "detailSegue", sender: nil)
        default:
        return true
        }
        
        return true
    }
}

//class AddPostVC: UIViewController {
//
//    @IBOutlet var textView: UITextView!
//
//    override func viewWillAppear(_ animated: Bool) {
//        textView.returnKeyType = .done
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        if text == "\n" {
//            textView.resignFirstResponder()
//            navigationController?.popViewController(animated: true)
//            return false
//        }
//
//        return true
//    }
//
//}

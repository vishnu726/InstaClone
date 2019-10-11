//
//  ViewController.swift
//  alpha
//
//  Created by Vishnu on 08/10/19.
//  Copyright © 2019 Vishnu. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = FS_RED
    }
    @IBAction func forgotpasswordBtn(_ sender: Any) {
        let vc = ResetPasswordVC()
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: nil)
       
    }
    @IBAction func loginBtn(_ sender: Any) {
        guard let email = emailTxt.text, email.isNotEmpty,
            let password = passwordTxt.text, password.isNotEmpty else {return}
            Auth.auth().signIn(withEmail: email,  password: password) { user, error in
                if let error = error{
                    self.handleFireAuthError(error)
                    debugPrint(error.localizedDescription)
                    return
                }
                
                self.dismiss(animated: true, completion: nil)
            }
            
    }
    @IBAction func fbLinkBtn(_ sender: Any) {
    }
    
    @IBAction func newUserBtn(_ sender: Any) {
        performSegue(withIdentifier: "toRegisterAccount", sender: self)
    }
    
}


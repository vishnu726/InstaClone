//
//  RegisterUserVC.swift
//  alpha
//
//  Created by Vishnu on 08/10/19.
//  Copyright © 2019 Vishnu. All rights reserved.
//

import UIKit
import Firebase

class RegisterUserVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var confirmPasswordTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = FS_RED

    }
    
    @IBAction func registerBtn(_ sender: Any) {
        guard let email = emailTxt.text, email.isNotEmpty,
            let password = passwordTxt.text, password.isNotEmpty else {return}
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.handleFireAuthError(error)
                debugPrint(error.localizedDescription)
                return
            }
            let credential = EmailAuthProvider.credential(withEmail: email, password: password)
            guard let user = Auth.auth().currentUser else { return }
            user.link(with: credential, completion: {( user , error ) in
            self.dismiss(animated: true, completion: nil)
                })
            
        }
    }
    @IBAction func fbLinkbtn(_ sender: Any) {
    }
    
   

}

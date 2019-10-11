//
//  HomeVC.swift
//  alpha
//
//  Created by Vishnu on 08/10/19.
//  Copyright © 2019 Vishnu. All rights reserved.
//

import UIKit
import Firebase

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously { (result, error)in
                if let error = error {
                    self.handleFireAuthError(error)
                }
            }
        }
    }
    
    @IBAction func login_logoutBtn(_ sender: Any) {
        guard let user = Auth.auth().currentUser else {return}
        if !user.isAnonymous {
            try! Auth.auth().signOut()
        }
        let storyBoard: UIStoryboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "loginVC") 
        self.present(newViewController, animated: true, completion: nil)
    }
    
}

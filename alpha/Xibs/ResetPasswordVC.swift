//
//  ResetPasswordVC.swift
//  alpha
//
//  Created by Vishnu on 08/10/19.
//  Copyright © 2019 Vishnu. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordVC: UIViewController {

    @IBOutlet weak var forgotVw: UIView!
    @IBOutlet weak var forgotLbl: UILabel!
    @IBOutlet weak var forgotEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        forgotVw.layer.cornerRadius = 20.0
       
    }
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func resetBtn(_ sender: Any) {
        guard let email = forgotEmail.text else {return}
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error{
                
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
}

//
//  Extensions.swift
//  alpha
//
//  Created by Vishnu on 08/10/19.
//  Copyright © 2019 Vishnu. All rights reserved.
//

import Foundation
import Firebase

extension String {
    var isNotEmpty : Bool {
        return !isEmpty
    }
}
extension UIViewController{
    func handleFireAuthError(_ error: Error){
        if let errorCode = AuthErrorCode(rawValue: error._code){
            let alert = UIAlertController(title: "Error", message: errorCode.errorrMessage, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil )
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
extension AuthErrorCode {
    var errorrMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "The email is already use with another account"
        case .userNotFound:
            return "Account not found for the specified user. please check and try again"
        case .userDisabled:
            return "your account has been disabled. please contact support."
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Please enter a valid mail"
        case .weakPassword:
            return "your password is tpp weak. The password must be 6 characters long or more."
        case .wrongPassword:
            return  "Your password is incorrect. please try again or use 'Forgot password' to reset your password"
        default:
            return "Sorry, something went wrong."
        }
    }
}

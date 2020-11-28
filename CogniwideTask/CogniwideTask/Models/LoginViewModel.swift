//
//  LoginViewModel.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 27/11/20.
//

import Foundation
import RxSwift

protocol LoginViewModelDelegate {
    func sendValue(from email:String, password:String)
}
class LoginViewModel: LoginViewModelDelegate {

    var delegate:LoginViewControllerDelegate?
    
    func sendValue(from email: String, password: String) {

        
        let emailValidation = validatePattern(text: email)
        let passwordValidation = validateLength(text: password , size: (8,15))
        if !emailValidation {
            delegate?.loginError(errorMsg: "Email is invalid")
        } else if !passwordValidation{
            delegate?.loginError(errorMsg: "Password must between 8 to 15 characters")
        } else if  passwordValidation && emailValidation {
            delegate?.loginSucces(successMsg: "Login Succesfull")
        }
       
    }
    
    func validateLength(text : String, size : (min : Int, max : Int)) -> Bool{
        return (size.min...size.max).contains(text.count)
    }
    func validatePattern(text : String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
}

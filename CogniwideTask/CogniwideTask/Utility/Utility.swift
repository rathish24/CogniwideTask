//
//  Utility.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 27/11/20.
//

import Foundation
import UIKit

class Utility {

    static func validateLength(text : String, size : (min : Int, max : Int)) -> Bool{
        return (size.min...size.max).contains(text.count)
    }
    static func validatePattern(text : String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }

}

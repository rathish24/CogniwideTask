//
//  BaseViewController.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 29/11/20.
//

import Foundation
import UIKit

class  BaseViewController : UIViewController {
    
func showAlert(title: String,message: String,alertStyle:UIAlertController.Style,actionTitles:[String],actionStyles:[UIAlertAction.Style],actions: [((UIAlertAction) -> Void)]){
    let messageAttrString = NSAttributedString(string: message, attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 15.0)!, NSAttributedString.Key.foregroundColor: UIColor.black])
       let alertController = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
       alertController.setValue(messageAttrString, forKey: "attributedMessage")

       for(index, indexTitle) in actionTitles.enumerated(){
           let action = UIAlertAction(title: indexTitle, style: actionStyles[index], handler: actions[index])
           alertController.addAction(action)
       }
       self.present(alertController, animated: true)
   }
}

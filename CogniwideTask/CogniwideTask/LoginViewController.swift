//
//  LoginViewController.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 23/11/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginViewController called")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var mainTabBarController:UIViewController
        if #available(iOS 13.0, *) {
             mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            // This is to get the SceneDelegate object from your view controller
            // then call the change root view controller function to change to main tab bar
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        } else{
            mainTabBarController = storyboard.instantiateViewController(withIdentifier:  "MainTabBarController")
            (UIApplication.shared.delegate as? AppDelegate)?.changeRootViewController(mainTabBarController)

        }
        
    }
    
//    @IBAction func logoutTapped(_ sender: UIButton) {
//        // ...
//            // after user has successfully logged out
//      
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
//
//        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginNavController)
//    }
    

}

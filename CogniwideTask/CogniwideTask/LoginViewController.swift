//
//  LoginViewController.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 23/11/20.
//

import UIKit


protocol LoginViewControllerDelegate {
    func loginSucces(successMsg: String)
    func loginError(errorMsg: String)
}

class LoginViewController: BaseViewController, LoginViewControllerDelegate {
   

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var scrollview: UIScrollView!
    let viewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginViewController called")
        viewModel.delegate = self

    }

    @IBAction func loginBtnAction(_ sender: UIButton) {
        guard let email = emailTF.text else { return }
        guard let password = passwordTF.text else { return }
        viewModel.sendValue(from: email, password: password)
    }


    func loginSucces(successMsg: String) {
    
        UserDefaults.standard.setLoggedIn(value: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var mainTabBarController: UIViewController
        if #available(iOS 13.0, *) {
            mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            // This is to get the SceneDelegate object from your view controller
            // then call the change root view controller function to change to main tab bar
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        } else {
            mainTabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController")
            (UIApplication.shared.delegate as? AppDelegate)?.changeRootViewController(mainTabBarController)

        }
    }

    func loginError(errorMsg: String) {
       
        showAlert(title: "", message: errorMsg, alertStyle: .alert, actionTitles: ["OK"], actionStyles: [.default],
                  actions: [
                      { _ in
                        
                       
                      }
                  ])
    }

}

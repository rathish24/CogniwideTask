//
//  AppDelegate.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 22/11/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      //  let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        window = UIWindow()
        var isLoggedIn = false
//        if isLoggedIn{
//            let tabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabViewController") as? MainTabViewController
//            window?.makeKeyAndVisible()
//            window?.backgroundColor = .white
//            window?.rootViewController = tabBarController
//        } else {
//            let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
//            window?.makeKeyAndVisible()
//            window?.backgroundColor = .white
//            window?.rootViewController = loginViewController
//        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        if let loggedUsername = UserDefaults.standard.string(forKey: "username") {
                // instantiate the main tab bar controller and set it as root view controller
                // using the storyboard identifier we set earlier
            var mainTabBarController: UIViewController
            if #available(iOS 13.0, *) {
                 mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
            } else {
                // Fallback on earlier versions
                mainTabBarController = storyboard.instantiateViewController(withIdentifier:  "MainTabBarController")
            }
                window?.rootViewController = mainTabBarController
            } else {
                // if user isn't logged in
                // instantiate the navigation controller and set it as root view controller
                // using the storyboard identifier we set earlier
                var loginNavController: UIViewController
                if #available(iOS 13.0, *) {
                    loginNavController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
                } else {
                    // Fallback on earlier versions
                    loginNavController = storyboard.instantiateViewController(withIdentifier:  "LoginNavigationController")
                }
               
                window?.rootViewController = loginNavController
            }
        return true
    }


    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else {
            return
        }
        
        // change the root view controller to your specific view controller
        window.rootViewController = vc
        UIView.transition(with: window,
                              duration: 0.5,
                              options: [.transitionCrossDissolve],
                              animations: nil,
                              completion: nil)
    }
}


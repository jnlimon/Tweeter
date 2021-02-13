//
//  LoginViewController.swift
//  Tweeter
//
//  Created by J6 on 2/10/21.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
        
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        
        let myUrl = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myUrl, success: {
            UserDefaults.standard.set(true, forKey:"userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Couldn't log in!")
        })
    }
}

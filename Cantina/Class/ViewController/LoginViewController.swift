//
//  LoginViewController.swift
//  Cantina
//
//  Created by Eduardo Rangel on 10/25/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
            if (error == nil) {
                // Perform any operations on signed in user here.
                // ...
            } else {
                print("\(error.localizedDescription)")
            }
    }
    
    

    //////////////////////////////////////////////////////////////////////
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    
}
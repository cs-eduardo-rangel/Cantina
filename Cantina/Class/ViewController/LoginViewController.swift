//
//  LoginViewController.swift
//  Cantina
//
//  Created by Eduardo Rangel on 10/25/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    //////////////////////////////////////////////////////////////////////
    // MARK: IBOutlet
    
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!

    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupGoogleSignIn()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - Instance Methods
    
    func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signInSilently()
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - IBAction
    
    @IBAction func login(sender: AnyObject) {
        self.indicatorView.startAnimating()
        
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }

    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - GIDSignInDelegate
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if (error == nil) {
            self.performSegueWithIdentifier("SegueToPurchases", sender: self)

            self.indicatorView.stopAnimating()
            
//            let userId = user.userID                  // For client-side use only!
//            let idToken = user.authentication.idToken // Safe to send to the server
//            let name = user.profile.name
//            let email = user.profile.email
            
//            NSNotificationCenter.defaultCenter().postNotificationName("ToggleAuthUINotification", object: nil, userInfo: ["statusText": "Sign In do Usuário:\n\(name)"])
        }
        else {
            self.indicatorView.stopAnimating()
            
            print(">>>>>>>>>> \(error.localizedDescription)")
            
//            NSNotificationCenter.defaultCenter().postNotificationName("ToggleAuthUINotification", object: nil, userInfo: nil)
        }
    }
    
    
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!, withError error: NSError!) {
        print(">>>>>>>>>> signIn:didDisconnectWithUser:withError")
        
//        NSNotificationCenter.defaultCenter().postNotificationName("ToggleAuthUINotification", object: nil, userInfo: ["statusText": "Usuário disconectado."])
    }
    
    
    
}
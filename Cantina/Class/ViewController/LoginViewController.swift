//
//  LoginViewController.swift
//  Cantina
//
//  Created by Eduardo Rangel on 10/25/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

import UIKit

// Match the ObjC symbol name inside Main.storyboard.
//@objc(LoginViewController)

class LoginViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    @IBOutlet weak var googleSignInButton: GIDSignInButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupGoogleSignInDelegates
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupGoogleSignInDelegates() {
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    
    @IBAction func didTapSignOut(sender: AnyObject) {
//        GIDSignIn.sharedInstance().signOut()
        
        print("LOGOUT")
    }

    //////////////////////////////////////////////////////////////////////
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    

    //////////////////////////////////////////////////////////////////////
    // MARK: - GIDSignInDelegate
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        print("signIn:didSignInForUser:withError")
        
        if (error == nil) {
            self.performSegueWithIdentifier("", sender: self)
            
            // Perform any operations on signed in user here.
//            let userId = user.userID                  // For client-side use only!
//            let idToken = user.authentication.idToken // Safe to send to the server
//            let name = user.profile.name
//            let email = user.profile.email
            
            //            NSNotificationCenter.defaultCenter().postNotificationName("ToggleAuthUINotification", object: nil, userInfo: ["statusText": "Signed in user:\n\(name)"])
        } else {
            print("\(error.localizedDescription)")
            
//            NSNotificationCenter.defaultCenter().postNotificationName("ToggleAuthUINotification", object: nil, userInfo: nil)
        }
    }
    
    
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!, withError error: NSError!) {
        // Perform any operations when the user disconnects from app here.
        
        print("signIn:didDisconnectWithUser:withError")
        
//        NSNotificationCenter.defaultCenter().postNotificationName("ToggleAuthUINotification", object: nil, userInfo: ["statusText": "User has disconnected."])
    }
    
    
    
    
    
}
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
            
            CredentialsService.logInUser(user, completion: { (success, error) -> Void in
                
                self.indicatorView.stopAnimating()
                if(success){
                    self.performSegueWithIdentifier("SegueToPurchases", sender: self)
                }else {
                    let alertController = UIAlertController.init(title: ":(", message: error as String, preferredStyle: .Alert)
                    let okBtn = UIAlertAction.init(title: "Ok", style: .Cancel, handler: nil)
                    alertController.addAction(okBtn)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            })
        }
    }
                
    
    
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!, withError error: NSError!) {
        print(">>>>>>>>>> signIn:didDisconnectWithUser:withError")
        
//        NSNotificationCenter.defaultCenter().postNotificationName("ToggleAuthUINotification", object: nil, userInfo: ["statusText": "Usuário disconectado."])
    }
    
    
    
}
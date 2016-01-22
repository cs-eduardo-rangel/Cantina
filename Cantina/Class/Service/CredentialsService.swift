//
//  CredentialsService.swift
//  Cantina
//
//  Created by Victor Landeira on 1/22/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

class CredentialsService: NSObject {
    typealias userExistsBlockType = (Bool,NSString) ->Void
    typealias userCreatedBlockType = (Bool, Credentials) ->Void
    
    
    class func logInUser(user:GIDGoogleUser, completion:userExistsBlockType) ->  Void{
        
        //Check User email with ConcreteSolutions
        if !user.profile.email.lowercaseString.containsString("concretesolutions.com.br"){
            completion(false,"O Email precisa pertencer à Concrete Solutions.")
            return
        }
        
        let credentialsQuery = PFQuery(className: Credentials.parseClassName())
        credentialsQuery.whereKey("googlePlusId", equalTo: user.userID)
        credentialsQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if objects?.count > 0{
                
                self.addCredentialsToInstalation(objects?.first as! Credentials)
                completion(true,"")
            }else{
                //creates new User
                self.createUserCredentials(user, creationCompletion: { (success, userCredentials) -> Void in
                    if(success){
                        //STORE CREDENTIALS IN APP
                        self.addCredentialsToInstalation(userCredentials)
                        
                        completion(true,"")
                    }else{
                        completion(false, "Não foi possível criar usuário.\n Tente novamente")
                    }
                })
                
            }
        }
    }
    
    class func createUserCredentials(googleUser:GIDGoogleUser,creationCompletion:userCreatedBlockType) -> Void{
        
        let newUser = Credentials.init()
        
        newUser.googlePlusId = googleUser.userID
        newUser.email = googleUser.profile.email
        newUser.name = googleUser.profile.name
        newUser.image = "\(googleUser.profile.imageURLWithDimension(150))"
        
        
        newUser.saveInBackgroundWithBlock { (success, error) -> Void in
            creationCompletion(success, newUser)
        }
    }
    
    class func addCredentialsToInstalation(credentials:Credentials){
        PFInstallation.currentInstallation()["userCredentials"] = credentials
        PFInstallation.currentInstallation().saveInBackground()
    }
}

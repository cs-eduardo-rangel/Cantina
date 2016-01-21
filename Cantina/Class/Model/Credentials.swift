//
//  Credentials.swift
//  Cantina
//
//  Created by Victor Landeira on 1/21/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

import UIKit

class Credentials: PFObject, PFSubclassing {

    @NSManaged var name: String
    @NSManaged var email: String
    @NSManaged var googlePlusId: String
    @NSManaged var image: PFFile
    
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String{
        return "Credentials"
    }
    
}

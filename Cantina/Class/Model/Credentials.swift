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
    
    class func parseClassName() -> String{
        return "Credentials"
    }
    
}

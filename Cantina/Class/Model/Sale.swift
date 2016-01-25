//
//  Sale.swift
//  Cantina
//
//  Created by Victor Landeira on 1/21/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

import UIKit
import Parse
import Google

class Sale: PFObject, PFSubclassing {
    
    @NSManaged var product: Product
    @NSManaged var buyer: Credentials
    @NSManaged var paid: Bool
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String{
        return "Sale"
    }
    
}


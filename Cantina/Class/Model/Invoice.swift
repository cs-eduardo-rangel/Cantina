//
//  Invoice.swift
//  Cantina
//
//  Created by Victor Landeira on 1/25/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

import Parse

class Invoice: PFObject, PFSubclassing {
    @NSManaged var paid: Bool
    @NSManaged var buyer: Credentials
    @NSManaged var sales: [Sale]

    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String {
        return "Invoice"
    }
}


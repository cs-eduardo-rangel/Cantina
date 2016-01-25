//
//  Sale.swift
//  Cantina
//
//  Created by Victor Landeira on 1/21/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

import Parse

class SaleState: PFObject, PFSubclassing {
    
    @NSManaged var order: NSNumber
    @NSManaged var name: NSString
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    
    class func parseClassName() -> String {
        return "SaleState"
    }

}


class Sale: PFObject, PFSubclassing {
    @NSManaged var product: Product
    @NSManaged var buyer: Credentials
    @NSManaged var state: SaleState
    
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    class func parseClassName() -> String {
        return "Sale"
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        if let object = object as? Sale {
            return product == object.product
        } else {
            return false
        }
    }
    
    override var hash: Int {
        return product.hash
    }
    
    
}

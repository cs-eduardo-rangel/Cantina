//
//  Product.swift
//  Cantina
//
//  Created by Eduardo Rangel on 8/22/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

import Parse

class Product: PFObject, PFSubclassing {
    @NSManaged var name: String
    @NSManaged var barCode: String
    @NSManaged var price: NSNumber
    @NSManaged var amount: NSNumber
    @NSManaged var image: PFFile
    
    
    
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    
    class func parseClassName() -> String {
        return "Product"
    }
    
    
    override func isEqual(object: AnyObject?) -> Bool {
        if let object = object as? Product {
            return objectId == object.objectId && name == object.name
        }
        else {
            return false
        }
    }
    
    
    override var hash: Int {
        return (objectId?.hashValue)! ^ name.hashValue
    }
}

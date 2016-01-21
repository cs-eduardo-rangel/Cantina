//
//  Product.swift
//  Cantina
//
//  Created by Eduardo Rangel on 8/22/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

import UIKit

class Product: PFObject, PFSubclassing {
    
    @NSManaged var name: String
    @NSManaged var barCode: String
    @NSManaged var price: NSNumber
    @NSManaged var amount: NSNumber
    @NSManaged var image: PFFile
    
    class func parseClassName() -> String{
        return "Product"
    }

}
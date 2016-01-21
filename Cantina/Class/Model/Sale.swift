//
//  Sale.swift
//  Cantina
//
//  Created by Victor Landeira on 1/21/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

import UIKit


class Sale: PFObject, PFSubclassing {
    
    @NSManaged var product: Product
    @NSManaged var buyer: Credentials
    @NSManaged var paid: Bool
    
    class func parseClassName() -> String{
        return "Sale"
    }
    
}


//
//  SaleService.swift
//  Cantina
//
//  Created by Erick Vicente on 24/01/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

import Parse

class SaleService: NSObject {
    typealias completionGetBlockType = (NSArray, NSError!) ->Void
    typealias completionSaveBlockType = (Bool, NSError!) ->Void
    
    
    class func getAllByCredential(credentials:Credentials, completion:completionGetBlockType) -> Void {
        Product.registerSubclass()
        
        let salesQuery = PFQuery(className: Sale.parseClassName())
        salesQuery.limit = 10000
        salesQuery.orderByDescending("createdAt")
        salesQuery.includeKey("product")
        salesQuery.whereKey("buyer", equalTo: credentials)

        salesQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil && objects?.count > 0 {
                completion(objects!,error)
            }
        }
    }
    
    
    class func saveAll(sales:NSArray, completion:completionSaveBlockType) -> Void {
        [PFObject .saveAllInBackground(sales as? [PFObject], block: { (success, error) -> Void in
            completion(success, error)
        })]
    }
    
    
    
}

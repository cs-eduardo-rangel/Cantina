//
//  ProductService.swift
//  Cantina
//
//  Created by Victor Landeira on 1/21/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

import Parse
import Google

class ProductService: NSObject {
    typealias completionBlockType = (NSArray, NSError!) ->Void

    
    class func getAllProducts(completion:completionBlockType) ->  Void{
        let productsQuery = PFQuery(className: Product.parseClassName())
        productsQuery.limit = 10000
        productsQuery.orderByAscending("name")
        
        productsQuery.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil && objects?.count > 0{
                completion(objects!, error)
            }
        }
    }



}

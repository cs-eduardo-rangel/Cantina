//
//  ProductCell.swift
//  Cantina
//
//  Created by Eduardo Rangel on 8/26/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

import UIKit

protocol ProductCellDelegate {
    func addProductToBuy(product:Product)
    func removeProductToBuy(product:Product)
}

class ProductCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    var delegate:ProductCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func decreaseProduct(sender: AnyObject) {
        if self.productQuantityLabel.text == "0" {
            return
        }
        
        var productQuantity = Int(self.productQuantityLabel.text!)
        print("\(productQuantity!--)")
        self.productQuantityLabel.text = "\(productQuantity!--)"
    }
    
    @IBAction func increaseProduct(sender: AnyObject) {
        if self.productQuantityLabel.text == "10" {
            return
        }
        
        var productQuantity = Int(self.productQuantityLabel.text!)
        print("\(productQuantity!++)")
        self.productQuantityLabel.text = "\(productQuantity!++)"
    }
    
}
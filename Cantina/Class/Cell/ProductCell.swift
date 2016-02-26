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
    @IBOutlet weak var buttonAddProduct: UIButton!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    
    var product:Product!
    var delegate:ProductCellDelegate?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configureCell(product:Product, delegate:ProductCellDelegate) {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "pt_BR")
        
        self.buttonAddProduct.layer.cornerRadius = buttonAddProduct.frame.size.width / 2
        self.buttonAddProduct.clipsToBounds = true
        
        self.productPriceLabel.text = formatter.stringFromNumber(product.price)
        self.productNameLabel?.text = product.name
        
        self.delegate = delegate
        self.product = product
    }
    
    
    @IBAction func decreaseProduct(sender: AnyObject) {
        if self.productQuantityLabel.text == "0" {
            return
        }
        
        var productQuantity = Int(self.productQuantityLabel.text!)
        
        print("\(productQuantity!--)")
        
        self.productQuantityLabel.text = "\(productQuantity!--)"
        
        self.delegate?.removeProductToBuy(self.product)
    }
    
    
    @IBAction func increaseProduct(sender: AnyObject) {
        if self.productQuantityLabel.text == "10" {
            return
        }
        
        var productQuantity = Int(self.productQuantityLabel.text!)
        
        print("\(productQuantity!++)")
        
        self.productQuantityLabel.text = "\(productQuantity!++)"
        
        self.delegate?.addProductToBuy(self.product)
    }
}
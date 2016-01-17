//
//  ProductsViewController.swift
//  Cantina
//
//  Created by Eduardo Rangel on 8/26/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //////////////////////////////////////////////////////////////////////
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - Variables
    
    var products: [Product] = []
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - IBActions
    
    @IBAction func buyProducts(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            print("Comprando #\(self.products)!", terminator: "")
        })
    }
    
    
    @IBAction func addProduct(sender: AnyObject) {
        let produto = Product()
        self.products.append(produto)
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //self.products.count;
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ProductCell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath) as! ProductCell
        
//        let product = self.products[indexPath.row]
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "pt_BR")
        
//        cell.price?.text = formatter.stringFromNumber(product.price)
//        cell.name?.text = product.name
//        cell.purchaseTime?.text = product.purchaseTime
//        cell.purchaseDate?.text = product.purchaseDate
        
        let foods = ["Food1", "Food2", "Food3"]
        
        for imageName in foods {
            cell.productImage.image = UIImage(named: imageName)
        }
        
        Util.roundImageView(cell.productImage)
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!", terminator: "")
    }
    
    

    //////////////////////////////////////////////////////////////////////
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    
    
}
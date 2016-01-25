//
//  ProductsViewController.swift
//  Cantina
//
//  Created by Eduardo Rangel on 8/26/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ProductCellDelegate {
    
    //////////////////////////////////////////////////////////////////////
    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - Variables
    
    var sales: NSMutableArray! = NSMutableArray()
    var products: [Product] = []
    var credential: Credentials?
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CredentialsService.getUser(CredentialStore().get(), completion : { (success, object) -> Void in
            self.credential = object
        })
        
        ProductService.getAllProducts({ (objects, error) -> Void in
            self.products = objects as! [Product]
            self.tableView.reloadData()
        })
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - IBActions
    
    @IBAction func buyProducts(sender: AnyObject) {
        
        let totalPrice = self.sales.reduce(0) {$0 + CGFloat(($1 as! Sale).product.price)}
        let alertController = UIAlertController(title: "Confirma", message: "Compra no valor de R$" +  String(format: "%.2f", totalPrice) + "?", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Não", style: .Cancel) { (action) in
        
        }
        
        let OKAction = UIAlertAction(title: "Sim", style: .Default) { (action) in
            SaleService.saveAll(self.sales, completion: { (success, error) -> Void in
                self.dismissViewControllerAnimated(true, completion: { () -> Void in
                    print("Comprando #\(self.sales)!", terminator: "")
                })
            })
            
        }
        
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true) {
            
        }
        
//        let customIcon = UIImage(named: "Food3")
//        let alertview = JSSAlertView().show(self, title: "Kitchen sink", text: "Here's a modal alert with descriptive text, an icon, custom fonts and a custom color", buttonText: "Sweet", color: UIColorFromHex(0xE0107A, alpha: 1), iconImage: customIcon)
//        alertview.addAction(closeCallback)
//        alertview.setTitleFont("ClearSans-Bold")
//        alertview.setTextFont("ClearSans")
//        alertview.setButtonFont("ClearSans-Light")
//        alertview.setTextTheme(.Light)
    }
    
    
    @IBAction func addProduct(sender: AnyObject) {
        let product = Product()
        self.products.append(product)
    }
    
    
    @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
        })
    }
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - ProductCellDelegate
    
    func addProductToBuy(product: Product) {
        let sale = Sale()
        sale.product = product
        sale.buyer = credential!
        sale.paid = false
        self.sales.addObject(sale)
    }
    
    func removeProductToBuy(product: Product) {
        let sale = Sale()
        sale.product = product
        sale.buyer = credential!
        sale.paid = false
        self.sales.removeObject(sale)
    }
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - Instance Methods
    
    func closeCallback() {
        print("opa")
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ProductCell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath) as! ProductCell
        
        cell.configureCell(self.products[indexPath.row], delegate: self)
        
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
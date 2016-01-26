//
//  PurchasesViewController.swift
//  Cantina
//
//  Created by Eduardo Rangel on 8/22/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

import UIKit
import Google

class PurchasesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var debitLabel: UILabel!
    
    var sales: [Sale] = []
    var debit = 0.0
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        CredentialsService.getUser(CredentialStore().get(), completion : { (success, object) -> Void in
            SaleService.getAllByCredential(object!, completion : { (objects, error) -> Void in
                self.sales = objects as! [Sale]
                
                let formatter = NSNumberFormatter()
                formatter.numberStyle = .CurrencyStyle
                formatter.locale = NSLocale(localeIdentifier: "pt_BR")
                
                let totalDebit = self.sales.reduce(0) {$0 + CGFloat($1.product.price)}
                
                self.debitLabel.text = formatter.stringFromNumber(totalDebit)
                
                self.tableView.reloadData()
            })
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - IBActions
    
    @IBAction func logout(sender: AnyObject) {
        let alertController = UIAlertController(title: "Logout", message: "Quer mesmo sair?", preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Não", style: .Cancel) { (action) in
            
        }
        
        let OKAction = UIAlertAction(title: "Sim", style: .Default) { (action) in
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                GIDSignIn.sharedInstance().signOut()
            })
        }
        
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true) {
            
        }
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sales.count
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: PurchaseCell = tableView.dequeueReusableCellWithIdentifier("PurchaseCell", forIndexPath: indexPath) as! PurchaseCell
        let sale = self.sales[indexPath.row]
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "pt_BR")
        
        cell.price?.text = formatter.stringFromNumber(sale.product.price)
        cell.name?.text = sale.product.name
        cell.purchaseTime?.text = NSDate.hourMinute(sale.createdAt!)
        cell.purchaseDate?.text = NSDate.dayMonth(sale.createdAt!)
        
        self.sales.sortInPlace {
            $0.createdAt!.compare($1.createdAt!) == NSComparisonResult.OrderedDescending
        }
        
        return cell
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    
    
}
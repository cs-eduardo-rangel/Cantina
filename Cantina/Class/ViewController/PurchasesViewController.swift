//
//  PurchasesViewController.swift
//  Cantina
//
//  Created by Eduardo Rangel on 8/22/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

import UIKit

class PurchasesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var debitLabel: UILabel!
    
    var products: [Product] = []
    var debit = 0.0
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - IBActions

    @IBAction func openProductList(sender: AnyObject) {
        self.products.append(self.createProduct())
        
        self.tableView.reloadData()
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: PurchaseCell = tableView.dequeueReusableCellWithIdentifier("PurchaseCell", forIndexPath: indexPath) as! PurchaseCell
        
        let product = self.products[indexPath.row]
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "pt_BR")
        
        cell.price?.text = formatter.stringFromNumber(product.price)
        cell.name?.text = product.name
        cell.purchaseTime?.text = product.purchaseTime
        cell.purchaseDate?.text = product.purchaseDate
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!", terminator: "")
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - Instance Methods
    
//    func teste() {
//        self.products.append(self.createProduct())
//
//        self.tableView.reloadData()
//    }

    
    func createProduct() -> Product {
        let product = Product()
        
        let productNames = ["Mate Leão", "Biscoito Goiabinha", "Fanta Laranja", "Coca-Cola", "Água", "Trakinas Morango", "Trakinas Chocolate", "Bolo de Cenoura"]
        
        product.name = productNames[Int(arc4random_uniform(UInt32(productNames.count)))]
        product.price = 12.47
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Hour, .Minute, .Day, .Month], fromDate: date)
        let hour = components.hour
        let minute = components.minute
        let day = components.day
        let month = components.month
        
        product.purchaseTime = String(format: "%d:%.2dh", hour, minute)
        product.purchaseDate = String(format: "%@ %d", self.monthStringWithMonth(month), day)
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale(localeIdentifier: "pt_BR")
        
        self.debit += product.price

        self.debitLabel.text = formatter.stringFromNumber(self.debit)
        
        return product
    }
    
    
    func monthStringWithMonth(month: Int) -> String {
        let months = ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"]
        
        return months[month - 1]
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    
    
}
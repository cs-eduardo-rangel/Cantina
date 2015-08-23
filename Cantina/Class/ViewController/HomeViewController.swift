//
//  ViewController.swift
//  Cantina
//
//  Created by Eduardo Rangel on 8/22/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    var products: [String] = ["We", "Heart", "Swift"]
    
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

    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count;
    }
    
    
    
    //////////////////////////////////////////////////////////////////////
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:ProductCell = tableView.dequeueReusableCellWithIdentifier("ProductCell", forIndexPath: indexPath) as! ProductCell
        
        cell.name?.text = self.products[indexPath.row]
        cell.price?.text = "R$ 5,37"
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
}
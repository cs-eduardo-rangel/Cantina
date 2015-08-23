//
//  ProductCell.swift
//  Cantina
//
//  Created by Eduardo Rangel on 8/22/15.
//  Copyright © 2015 Concrete Solutions. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet var price: UILabel!
    @IBOutlet var purchaseTime: UILabel!
    @IBOutlet var purchaseDate: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

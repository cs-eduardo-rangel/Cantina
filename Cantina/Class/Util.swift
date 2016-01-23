//
//  Util.swift
//  Cantina
//
//  Created by Eduardo Rangel on 1/17/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

import UIKit
import Foundation

class Util: NSObject {
    
    static func roundImageView(imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
    }
    
    
    
}
//
//  UIImageViewExtension.swift
//  Cantina
//
//  Created by Eduardo Rangel on 1/26/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    static func roundImageView(imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
    }
    
    
    
}

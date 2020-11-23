//
//  Extension + UIView.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}

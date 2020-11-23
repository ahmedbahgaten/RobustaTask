//
//  LoaderView.swift
//  RobustaTask
//
//  Created by Ahmed on 11/17/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoaderView: UIView {
    
    @IBOutlet weak var activityIndicator: NVActivityIndicatorView!
    
    override func draw(_ rect: CGRect) {
          
          activityIndicator.startAnimating()
      }
}

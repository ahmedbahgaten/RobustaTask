//
//  Extension + UIViewController.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func hideNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    func alert(title: String, message: String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: { (action: UIAlertAction!) in
                // Handle Cancel Logic here
            })
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

//
//  ImageDownloader.swift
//  RobustaTask
//
//  Created by Ahmed on 11/17/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import UIKit
import NVActivityIndicatorView
class ImageDownloader {
    
    static func downloadImage(downloadableImage:String,completion:@escaping (UIImage?) -> () ) {
        var image:UIImage?
        guard let url = URL(string: downloadableImage) else {
            return
        }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf:url ) {
                image = UIImage(data: data)
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
    }
}

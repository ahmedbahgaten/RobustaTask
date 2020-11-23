//
//  ExtensionForLoaderView.swift
//  RobustaTask
//
//  Created by Ahmed on 11/16/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    private static var customLoadingView: LoaderView?
    private static var heightAnchor: NSLayoutConstraint?
    private static var widthAnchor: NSLayoutConstraint?
    private static var loadingCount: Int = 0

    var loadingView: LoaderView? {
        
        get { return UIViewController.customLoadingView }
        set { UIViewController.customLoadingView = newValue }
    }

    func showLoading() {
        
        DispatchQueue.main.async {
            
            UIViewController.loadingCount = UIViewController.loadingCount + 1
            guard UIViewController.loadingCount == 1 else { return }
            self.setupLoadingView()
        }
    }

    func hideLoading() {
        
        DispatchQueue.main.async {
            
            UIViewController.loadingCount = UIViewController.loadingCount - 1
            guard UIViewController.loadingCount == 0 else {
                return
            }
            self.removeLoadingView()
        }
    }

    private func setupLoadingView() {
        
        loadingView = Bundle.main.loadNibNamed("LoaderView", owner: self, options: nil)?.first as? LoaderView
        if loadingView != nil {
            
            currentView().addSubview(loadingView!)
            setupLoadingViewConstraints()
        }
    }

    private func setupLoadingViewConstraints() {
        
        loadingView?.translatesAutoresizingMaskIntoConstraints = false
        loadingView?.centerXAnchor.constraint(equalTo: currentView().centerXAnchor).isActive = true
        loadingView?.centerYAnchor.constraint(equalTo: currentView().centerYAnchor).isActive = true
        loadingView?.widthAnchor.constraint(equalToConstant: currentView().frame.width).isActive = true
        loadingView?.heightAnchor.constraint(equalToConstant: currentView().frame.height).isActive = true
    }

    private func removeLoadingView() {
        
        if loadingView != nil {
            
            self.loadingView?.removeFromSuperview()
            self.loadingView = nil
        }
    }

    private func currentView() -> UIView {
        
        if let view = self.tabBarController?.view {
            
            return view
        } else if let view = self.navigationController?.view {
            
            return view
        } else {
            
            return self.view
        }
    }
}

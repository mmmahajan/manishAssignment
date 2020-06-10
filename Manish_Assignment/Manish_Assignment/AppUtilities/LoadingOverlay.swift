//
//  LoadingOverlay.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 10/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import UIKit

open class LoadingOverlay {
    
    var containerView = UIView()
    var progressView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    /// Show progress View
    /// - Parameter view: Pass view where to show Progress View
    func showProgressView(_ view: UIView) {
        
        containerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        
        containerView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        progressView.center = CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
        progressView.layer.cornerRadius = 10
        containerView.addSubview(progressView)
        
        progressView.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        progressView.clipsToBounds = true
        
        activityIndicator.frame = CGRect(x: 20, y: 20, width: 40, height: 40)
        activityIndicator.style = .whiteLarge
        progressView.addSubview(activityIndicator)
        
        view.addSubview(containerView)
        activityIndicator.startAnimating()
    }
    
    
    /// Hide Progress view
    func hideProgressView() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
}

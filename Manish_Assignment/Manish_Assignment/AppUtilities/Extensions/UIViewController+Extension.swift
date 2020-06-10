//
//  UIViewController+Extension.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 09/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController : StoryboardIdentifiable {
    
    //Alert with handling
    func showMessageWithAction(_ messageText:String, messageTitle:String = "", okButtonTitle: String = "Ok", cancelButtonTitle:String? = nil, completion:@escaping (Bool) -> Void) {
        
        let attribute = NSMutableAttributedString.init(string: messageText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white , range: NSRange(location: 0,length: messageText.count))
        
        let alert = UIAlertController(title: messageTitle,
                                      message: messageText,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.view.tintColor = UIColor(red: (0/255.0), green: (29/255.0), blue: (97/255.0), alpha: 1.0)
        alert.addAction(UIAlertAction(title: okButtonTitle,
                                      style: UIAlertAction.Style.default,
                                      handler: {(alert: UIAlertAction!) in
                                        completion(true)
        }))
        if let cancelButton = cancelButtonTitle {
            alert.addAction(UIAlertAction(title: cancelButton,
                                          style: UIAlertAction.Style.cancel,
                                          handler: {(alert: UIAlertAction!) in
                                            completion(false)
            }))
        }
        self.present(alert, animated: true, completion: nil)
    }
}

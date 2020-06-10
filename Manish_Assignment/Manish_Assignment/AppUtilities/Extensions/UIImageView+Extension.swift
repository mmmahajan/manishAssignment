//
//  UIImageView+Extension.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 10/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func download(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            }.resume()
    }
    
    func getImage(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        guard let url = URL(string: URL.imageBase + link) else { return }
        download(from: url, contentMode: mode)
    }
}

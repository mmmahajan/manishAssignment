//
//  UICollectionView+Extension.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 10/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func setMovieCollectionLayout() {
        // Set scroll direction
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        self.collectionViewLayout = layout
        
        // Set properties
        self.alwaysBounceVertical = true
        self.alwaysBounceHorizontal = false
        
        // Set top/bottom padding
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        // Hide scrollers
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
}


//
//  MovieCollectionViewCell.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 09/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import UIKit

protocol MovieCollectionViewCellDelegate {
    
    func didDeleteClicked(cell: MovieCollectionViewCell)
}

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    var movieCollectionViewCellDelegate: MovieCollectionViewCellDelegate? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code        
    }
    // The @objc is added to silence the complier errors
    @objc class var identifier: String {
        return String(describing: self)
    }
    
    @IBAction func deleteCell(_ sender: Any) {
        movieCollectionViewCellDelegate?.didDeleteClicked(cell: self)
    }
}

extension MovieCollectionViewCell {
    
    //Get Dynamic Size
    func size(for indexPath: IndexPath, result: Results) -> CGSize {
        
        
        // configure cell with data in it
        self.title.text = result.title
        self.subTitle.text = result.overview
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        // width that you want
        let width = UIScreen.main.bounds.size.width - 1
        let height: CGFloat = 0
        
        let targetSize = CGSize(width: width, height: height)
        
        // get size with width that you want and automatic height
        let size = self.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .defaultHigh, verticalFittingPriority: .fittingSizeLevel)
        return size
    }
}

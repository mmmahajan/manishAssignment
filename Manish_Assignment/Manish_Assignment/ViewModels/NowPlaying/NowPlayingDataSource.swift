//
//  DataSource.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 10/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import UIKit

class NowPlayingDataSource: GenericDataSource<NowPlayingModel>, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as! MovieCollectionViewCell
        if let result = data.value[0].results {
            cell.title.text = result[indexPath.row].title
            cell.subTitle.text = result[indexPath.row].overview
            cell.movieImage.getImage(from: result[indexPath.row].poster_path ?? "")
        }
        cell.movieCollectionViewCellDelegate = controller as? MovieCollectionViewCellDelegate
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if data.value.count > 0 {
            return data.value[0].results?.count ?? 0
        }
        return 0
    }
}

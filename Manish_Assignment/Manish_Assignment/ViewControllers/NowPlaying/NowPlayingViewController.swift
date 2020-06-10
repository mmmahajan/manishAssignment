//
//  NowPlayingViewController.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 09/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import UIKit

class NowPlayingViewController: BaseViewController {

//    var nowPlayingViewModel = NowPlayingViewModel()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    let dataSource = NowPlayingDataSource()
    
    lazy var viewModel : NowPlayingViewModel = {        
        let viewModel = NowPlayingViewModel(dataSource: dataSource, controller: self)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: MovieCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        
        self.collectionView.dataSource = self.dataSource
        self.collectionView.delegate = self
        self.collectionView.setMovieCollectionLayout()
        
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.collectionView.reloadData()
        }
        self.viewModel.getNowPlayingData()
        searchBar.delegate = self
        // Do any additional setup after loading the view.
    }
}


extension NowPlayingViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(self.dataSource.data.value[0].results?[indexPath.row].title ?? "")
        
        let viewController: DetailsViewController = UIStoryboard(storyboard: .main).instantiateViewController()
        if let data = self.dataSource.data.value[0].results?[indexPath.row] {
            viewController.result = data
        }
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    //Detech top drag
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // UITableView only moves in one direction, y axis
        let currentOffset = scrollView.contentOffset.y
        
        if currentOffset < -10.0 {
            self.viewModel.getNowPlayingData()
        }
    }
}

//UICollectionViewDelegateFlowLayout Delegate method to get dynamic height of cell
extension NowPlayingViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // load cell from Xib
        let cell = Bundle.main.loadNibNamed("MovieCollectionViewCell", owner: self, options: nil)?.first as! MovieCollectionViewCell
        if let result = self.dataSource.data.value[0].results?[indexPath.row] {
            return cell.size(for: indexPath, result: result)
        }
        return CGSize.zero
    }
}

//UISearchBarDelegate delegate methods
extension NowPlayingViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchBar.text?.trimmingCharacters(in: .whitespaces) != "" else {
            self.dataSource.data.value[0].results = self.dataSource.data.copiedValue[0].results
            return
        }
        
        self.dataSource.data.value[0].results = self.dataSource.data.copiedValue[0].results?.filter({ (data) -> Bool in
            return data.title?.range(of: searchBar.text!, options: .caseInsensitive) != nil
        })
    }
    
    //remove keyboard
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

//Get action on click of delete button
extension NowPlayingViewController: MovieCollectionViewCellDelegate {
    
    func didDeleteClicked(cell: MovieCollectionViewCell) {
        self.showMessageWithAction("Do you want to delete this?", messageTitle: "Delete", okButtonTitle: "Yes", cancelButtonTitle: "No") { (flag) in
            if flag {
                if let index = self.collectionView.indexPath(for: cell) {
                    self.dataSource.data.value[0].results?.remove(at: index.row)
                    self.dataSource.data.copiedValue[0].results?.remove(at: index.row)
                }
            }
        }
    }
}


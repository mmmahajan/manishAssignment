//
//  TabItem.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 09/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import UIKit

enum TabItem: String, CaseIterable {
    
    //Items for Tab Navigation
    case nowPlaying = "nowPlaying"
    case topRated = "topRated"
    
    var viewController: UIViewController {
        switch self {
        case .nowPlaying:
            let storyboard = UIStoryboard(storyboard: .main)
            let viewController: NowPlayingViewController = storyboard.instantiateViewController()
            return UINavigationController(rootViewController: viewController)
        case .topRated:
            let storyboard = UIStoryboard(storyboard: .main)
            let viewController: TopRatedViewController = storyboard.instantiateViewController()
            return UINavigationController(rootViewController: viewController)
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .nowPlaying:
            return UIImage(named: "ic_nowPlaying")!
        case .topRated:
            return UIImage(named: "ic_topRated")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}

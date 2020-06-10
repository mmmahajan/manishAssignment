//
//  DetailsViewController.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 09/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    var result: Results? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeTop = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeTop.direction = .up
        self.detailView.addGestureRecognizer(swipeTop)
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.FlatColor.PrimaryColor
    }
    
    //Swipe animation for detail view
    @objc func respondToSwipeGesture() {
        detailView.transform = CGAffineTransform(translationX: 0, y: -200)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 2.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                        self?.detailView.transform = .identity
            },
                       completion: nil)
    }
    
    fileprivate func setupUI() {
        if let moviewDetails = result {
            mainTitle.text = moviewDetails.title ?? ""
            details.text = moviewDetails.overview ?? ""
            percentage.text = "\(moviewDetails.popularity ?? 0)%"
            time.text = "\(moviewDetails.release_date?.getTime() ?? "")"
            bgImage.getImage(from: moviewDetails.poster_path ?? "")
        }
    }
}

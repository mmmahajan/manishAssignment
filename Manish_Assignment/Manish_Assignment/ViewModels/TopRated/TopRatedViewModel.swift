//
//  NowPlayingViewModel.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 09/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import UIKit

class TopRatedViewModel {
    
    weak var dataSource : GenericDataSource<TopRatedModel>?
    weak var filteredDataSource : GenericDataSource<TopRatedModel>?

    init(dataSource : GenericDataSource<TopRatedModel>?, controller: UIViewController) {
        self.dataSource = dataSource
        self.filteredDataSource = dataSource
        self.dataSource?.controller = controller
    }
    
    //API call for top rated data
    func getTopRatedData() {
        
        Webservice().load(resource: TopRatedModel.topRated, onView: self.dataSource?.controller.view) {[weak self] result in
            switch result {
            case .success(let data):
                print("API success")
                self?.dataSource?.data.value = [data]
                self?.dataSource?.data.copiedValue = [data]
            case .failure(let error):
                print(error)
            }
        }
    }
}

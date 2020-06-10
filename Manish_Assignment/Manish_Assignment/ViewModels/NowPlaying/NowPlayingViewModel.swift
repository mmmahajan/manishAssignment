//
//  NowPlayingViewModel.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 09/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import UIKit

class NowPlayingViewModel {
    
    weak var dataSource : GenericDataSource<NowPlayingModel>?
    weak var filteredDataSource : GenericDataSource<NowPlayingModel>?
    
    init(dataSource : GenericDataSource<NowPlayingModel>?, controller: UIViewController) {
        self.dataSource = dataSource
        self.filteredDataSource = dataSource
        self.dataSource?.controller = controller
    }
    
    //API call for now playing data
    func getNowPlayingData() {
        
        Webservice().load(resource: NowPlayingModel.nowPlaying, onView: self.dataSource?.controller.view) {[weak self] result in
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

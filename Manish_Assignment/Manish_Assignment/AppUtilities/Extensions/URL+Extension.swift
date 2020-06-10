//
//  URL+Extension.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 09/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation

extension URL {
    
    static var base: String {
        return "https://api.themoviedb.org/3/movie"
    }
    
    static var imageBase: String {
        return "https://image.tmdb.org/t/p/w342/"
    }
    
    static var nowPlaying: URL? {
        return URL(string: base + "/now_playing?api_key=\(API_KEY)")
    }
    
    static var topRated: URL? {
        return URL(string: base + "/top_rated?api_key=\(API_KEY)")
    }
}

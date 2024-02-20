//
//  SliderListCode.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 16.02.2024.
//

import Foundation

enum SliderCode: Int {
//    case nowPlaying = 0
    case popular = 1
    case topRated = 2
    case upcoming = 3
}

extension SliderCode {
    var title: String {
        switch self {
//        case .nowPlaying:
//            return "Now Playing"
        case .popular:
            return "Popular"
        case .topRated:
            return "Top Rated"
        case .upcoming:
            return "Upcoming"
        }
    }
}

extension SliderCode {
    var path: String {
        switch self {
//        case .nowPlaying:
//            return "/now_playing"
        case .popular:
            return "/popular"
        case .topRated:
            return "/top_rated"
        case .upcoming:
            return "/upcoming"
        }
    }
}


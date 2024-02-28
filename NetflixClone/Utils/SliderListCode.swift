//
//  SliderListCode.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 16.02.2024.
//

import Foundation

enum SliderCode: Int {
    case topRated
    case popular
    case upcoming
    case nowPlaying
}

extension SliderCode {
    var title: String {
        switch self {
        case .popular:
            return "Popular"
        case .topRated:
            return "Top Rated"
        case .upcoming:
            return "Upcoming"
        case .nowPlaying:
            return "Now Playing"
        }
    }
}

extension SliderCode {
    var path: String {
        switch self {
        case .popular:
            return "/movie/popular"
        case .topRated:
            return "/movie/top_rated"
        case .upcoming:
            return "/movie/upcoming"
        case .nowPlaying:
            return "/movie/now_playing"
        }
    }
}


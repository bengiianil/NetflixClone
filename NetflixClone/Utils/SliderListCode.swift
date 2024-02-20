//
//  SliderListCode.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 16.02.2024.
//

import Foundation

enum SliderCode: Int {
    case popular
    case topRated
    case upcoming
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
        }
    }
}


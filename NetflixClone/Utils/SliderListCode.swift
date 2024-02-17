//
//  SliderListCode.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 16.02.2024.
//

import Foundation

enum SliderCode: Int {
    case nowPlaying = 0
    case popular
    case topRated
    case upcoming
}

extension SliderCode {
    var path: String {
        switch self {
        case .nowPlaying:
            return "/now_playing"
        case .popular:
            return "/popular"
        case .topRated:
            return "/topRated"
        case .upcoming:
            return "/upcoming"
        }
    }
}

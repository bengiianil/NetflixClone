//
//  GenreModel.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 20.02.2024.
//

import Foundation

class GenreModel: ObservableObject {
    @Published var genres: Genres?

    init(genres: Genres? = nil) {
        self.genres = genres
    }
}

struct Genres: Codable {
    let genres: [Genre]
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}


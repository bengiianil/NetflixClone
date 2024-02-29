//
//  MovieModel.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 30.01.2024.
//

import Foundation

class MovieModel: ObservableObject {
    @Published var movie: Movie?

    init(movie: Movie? = nil) {
        self.movie = movie
    }
}

struct Movie: Codable {
    let dates: Dates?
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let results: [Results]?
}

struct Dates: Codable {
    let maximum: String?
    let minimum: String?
}

struct Results: Codable, Equatable, Identifiable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let genreIds: [Int]

    static func == (lhs: Results, rhs: Results) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct MovieDetails: Codable {
    let releaseDate: String
    let runtime: Int
    let voteAverage: Double
}

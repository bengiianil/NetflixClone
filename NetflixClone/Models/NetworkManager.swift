//
//  NetworkManager.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 30.01.2024.
//

import Foundation

enum AppError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}

class NetworkManager {
    
    func fetchMovieDetail() async throws -> MovieDetail {
        guard let url = URL(string: "https://www.omdbapi.com/?i=tt3896198&apikey=edc960e") else {
            throw AppError.invalidUrl
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                throw AppError.invalidResponse
            }
            
            let decodedData = try JSONDecoder().decode(MovieDetail.self, from: data)
            return decodedData
            
        } catch {
            throw AppError.invalidData
        }
    }
}

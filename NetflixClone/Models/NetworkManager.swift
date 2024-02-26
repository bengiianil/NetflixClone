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
    var baseUrl = "https://api.themoviedb.org/3"
    var imageUrl = "https://image.tmdb.org/t/p/original"

    let headers: [String: String] = [
    "accept": "application/json",
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMTc3NjRhM2MxMGYwOGZhZGZhYjEwNWIzYTE4ZjllOSIsInN1YiI6IjYxNzI5NmRmMGQ1ZDg1MDA5MTVkNGNjYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qwilNEcOUXEueZjwyQN_JNx_6-kbwrOZXujhawlvbO8"
    ]

    func fetchData<T: Decodable>(for: T.Type, from path: String = "") async throws -> T {
        let fullUrl = baseUrl + path
  
        guard let url = URL(string: fullUrl) else {
            throw AppError.invalidUrl
        }
                
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw AppError.invalidResponse
        }
            
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase /// avatar_url -> avatarUrl
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw AppError.invalidData
        }
    }
}

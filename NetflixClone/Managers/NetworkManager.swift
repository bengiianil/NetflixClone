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

class NetworkManager: ObservableObject {
    static let shared = NetworkManager()

    let headers: [String: String] = [Constants.accept: Constants.application,
                                     Constants.auth: Constants.token]

    func fetchData<T: Decodable>(for: T.Type, from path: String = "") async throws -> T {
        let fullUrl = Constants.baseUrl + path
  
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

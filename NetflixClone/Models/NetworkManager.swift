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
    
    func fetchData<T: Decodable>(for: T.Type, from urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw AppError.invalidUrl
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                throw AppError.invalidResponse
            }
            
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
            
        } catch {
            throw AppError.invalidData
        }
    }
}

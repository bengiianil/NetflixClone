//
//  FavoriteViewModel.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 28.02.2024.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    var favMovies: [Results]
    private let saveKey = "Favorites"
    
    init() {
        self.favMovies = []
        load()
    }
    
    func contains(movie: Results) -> Bool {
        return favMovies.contains(movie)
    }
    
    func add(movie: Results) {
        objectWillChange.send()
        favMovies.append(movie)
        save()
    }
    
    func remove(movie: Results) {
        objectWillChange.send()
        if let index = favMovies.firstIndex(where: { $0.id == movie.id }) {
            favMovies.remove(at: index)
            save()
        }
    }
    
    func load() {
        // load our saved data
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decodedData = try? JSONDecoder().decode([Results].self, from: data) {
                favMovies = decodedData
            }
        }
    }
    
    func save() {
        // write out our data
        if let encodedData = try? JSONEncoder().encode(favMovies) {
            UserDefaults.standard.set(encodedData, forKey: saveKey)
        }
    }
}

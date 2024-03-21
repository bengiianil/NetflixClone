//
//  LoginViewModel.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 4.03.2024.
//

import Firebase
import Foundation

class LoginViewModel: ObservableObject {
    
    func login(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false, error.localizedDescription)
            } else {
                print("Login successful!")
                completion(true, "")
            }
        }
    }
    
    func register(name: String, email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false, error.localizedDescription)
            } else {
                print("Register successful!")
                completion(true, "")
            }
        }
    }
}

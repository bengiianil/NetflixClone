//
//  LoginViewModel.swift
//  NetflixClone
//
//  Created by Bengi Anıl on 4.03.2024.
//

import Firebase
import Foundation

enum LoginAlert: String {
    case successfulLogin = "Login successful!"
    case successfulRegister = "Register successful!"
    case sentPassword = "Password reset request sent successfully."
    case signOut = "Are you sure you want to log out of your account?"
    case registered = "You have already registered with this email before."
    case notRegistered = "You have not registered with this email before."
    case invalidData = "You have entered invalid data."
    case notMatchPassword = "The passwords you entered do not match."
}

class LoginViewModel: ObservableObject {
    static let shared = LoginViewModel()

    func login(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                completion(true, LoginAlert.successfulLogin.rawValue)
            }
        }
    }
    
    func register(name: String, email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                completion(true, LoginAlert.successfulRegister.rawValue)
            }
        }
    }
    
    func signOut(completion: @escaping (Bool, String) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true, LoginAlert.signOut.rawValue)
        } catch let error {
            completion(false, error.localizedDescription)
        }
    }
    
    func forgotPassword(email: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                completion(true, LoginAlert.sentPassword.rawValue)
            }
        }
    }
    
    func checkIfUserExists(email: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().fetchSignInMethods(forEmail: email) { (signInMethods, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else if let signInMethods = signInMethods {
                completion(true, LoginAlert.registered.rawValue)
            } else {
                completion(false, LoginAlert.notRegistered.rawValue)
            }
        }
    }
}

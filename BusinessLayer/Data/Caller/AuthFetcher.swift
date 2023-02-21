//
//  AuthFetcher.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 10/02/23.
//

import Foundation
import Firebase

public class AuthFetcher: RegisterRepository, LoginRepository, LogoutRepository {
    
    public static let shared = AuthFetcher()
    private init() {}
    
    func createUser(user: User, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { (result, error) in
            guard error == nil else {
                completion(.failure(CallerErrors.requestError))
                return
            }
            completion(.success(true))
        }
    }
    
    func loginUser(user: User, completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { (result, error) in
            guard error == nil else {
                completion(.failure(CallerErrors.requestError))
                return
            }
            completion(.success(true))
        }
    }
    
    func logoutUser(completion: @escaping (Result<Bool, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(.success(true))
        }
        catch {
            completion(.failure(CallerErrors.requestError))
            
        }
        
    }
}

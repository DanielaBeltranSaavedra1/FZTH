//
//  AuthSigin.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 10/02/23.
//

import Foundation

struct AuthUser: Codable {
    let email: String
    let passwod: String
    
    enum CodingKeys : String, CodingKey {
        case email = "email"
        case passwod = "passwod"
    }
}

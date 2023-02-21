//
//  User.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 10/02/23.
//

import Foundation

struct User{
    let email: String
    let password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

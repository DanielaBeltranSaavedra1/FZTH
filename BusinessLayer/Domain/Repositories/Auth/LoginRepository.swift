//
//  LoginRepository.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 10/02/23.
//

import Foundation

protocol LoginRepository {
    func loginUser(user: User, completion: @escaping(Result< Bool,Error>) -> Void)
}

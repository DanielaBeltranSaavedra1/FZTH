//
//  RegisterRepository.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 10/02/23.
//

import Foundation

protocol RegisterRepository {
    func createUser(user: User, completion: @escaping(Result< Bool,Error>) -> Void)
}

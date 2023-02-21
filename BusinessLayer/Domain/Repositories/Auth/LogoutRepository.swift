//
//  LogoutRepository.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 13/02/23.
//

import Foundation

protocol LogoutRepository {
    func logoutUser(completion: @escaping(Result< Bool,Error>) -> Void)
}

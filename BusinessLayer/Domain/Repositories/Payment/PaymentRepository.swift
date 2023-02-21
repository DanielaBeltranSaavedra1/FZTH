//
//  PaymentRepository.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 9/02/23.
//

import Foundation

protocol PaymentRepository {
    func pay(payment: Payment, completion: @escaping(Result< Bool,Error>) -> Void)
}

//
//  Payment.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 11/02/23.
//

import Foundation

struct PaymentEntity: Codable {
    let amount: Double
    let creditCard: CreditCardEntity
    
    enum CodingKeys : String, CodingKey {
        case amount = "amount"
        case creditCard = "credit_card"
    }
}

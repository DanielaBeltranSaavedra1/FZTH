//
//  PaymentCreditCard.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 11/02/23.
//

import Foundation

struct CreditCardEntity: Codable {
    let number: String
    let ownerName: String
    let cvv: String
    let expDate: String
    
    enum CodingKeys : String, CodingKey {
        case number = "email"
        case ownerName = "passwod"
        case cvv = "cvv"
        case expDate = "exp_date"
    }
}

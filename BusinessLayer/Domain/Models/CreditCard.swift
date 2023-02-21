//
//  CreditCard.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 9/02/23.
//

import Foundation

struct CreditCard {
    let number: String
    let ownerName: String
    let cvv: String
    let expDate: String
    
    internal func mapToCreditCardEntity() -> CreditCardEntity {
        return CreditCardEntity(number: self.number,
                                 ownerName: self.ownerName,
                                 cvv: self.cvv,
                                 expDate: self.expDate)
    }
}

//
//  Payment.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 11/02/23.
//

import Foundation

struct Payment {
    let amount: Double
    let creditCard: CreditCard
    
    internal func mapToPaymentEntity() -> PaymentEntity{
        return PaymentEntity(amount: self.amount,
                       creditCard: self.creditCard.mapToCreditCardEntity())
    }
}

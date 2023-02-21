//
//  PaymentConstants.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 9/02/23.
//

import Foundation

struct PaymentConstants{
    private static let PAYMENT_BASE_URL = "http://0.0.0.0:3003/"
    
    static let PAYMENT_PAY = URL(string: PAYMENT_BASE_URL + "pay")
}

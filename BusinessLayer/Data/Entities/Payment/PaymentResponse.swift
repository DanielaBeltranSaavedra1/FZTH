//
//  PaymentResponse.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 9/02/23.
//

import Foundation


struct PaymentResponse: Codable {
    let isPay: Bool
  
    enum CodingKeys : String, CodingKey {
        case isPay = "is_pay"
    }
}

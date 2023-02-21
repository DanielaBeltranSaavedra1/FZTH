//
//  SubscriptionStates.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 9/02/23.
//

import Foundation

public struct SubscriptionStates{
    var cvvNumber: String = ""
    var dateNumber: String = ""
    var cardNumber: String = ""
    var cardOwner: String = ""
    var selectBasic: Bool = false
    var selectAdvanced: Bool = false
    var subscription: Subscription = Subscription(type: .BASIC)
    var success: Bool = false
    var error: Bool = false
}

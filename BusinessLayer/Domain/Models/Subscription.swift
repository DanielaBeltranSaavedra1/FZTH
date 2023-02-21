//
//  Subscription.swift
//  BusinessLayer
//
//  Created by Daniela Paola Beltran Saavedra on 9/02/23.
//

import Foundation

struct Subscription {
    let type: Subscriptions
    var price: Double {
        switch type {
        case .BASIC:
            return   9.99
        case .ADVANCED:
            return  19.99
        }
    }
    var information: [String] {
        switch type {
        case .BASIC:
            return   ["Watch everithing with ads."]
        case .ADVANCED:
            return ["Download your favorites movies."]
        }
    }
    public enum Subscriptions: String{
        case BASIC = "Basic"
        case ADVANCED = "Advanced"
    }
}

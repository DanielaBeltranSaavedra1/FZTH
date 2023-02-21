//
//  SubscriptionViewModel.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 9/02/23.
//

import Foundation

public class SubscriptionViewModel: ObservableObject{
    @Published var state: SubscriptionStates
    private let paymentUsecase: PaymentUsecase
    
    init() {
        self.paymentUsecase = PaymentUsecase(paymentRepository: PaymentFetcher.shared)
        self.state = SubscriptionStates()
    }
    
    func onEvet(event: SubscriptionEvents){
        switch(event){
        case .selectSubscription(subscription: let subscription):
            switch subscription {
            case .BASIC:
                self.state.subscription = Subscription(type: .BASIC)
                self.state.selectAdvanced = false
                self.state.selectBasic = true
            case .ADVANCED:
                self.state.subscription = Subscription(type: .ADVANCED)
                self.state.selectAdvanced = true
                self.state.selectBasic = false
            }
        case .purchase:
            paymentUsecase.pay(payment: Payment(amount: state.subscription.price, creditCard: CreditCard(number: state.cardNumber, ownerName: state.cardOwner, cvv: state.cvvNumber, expDate: state.dateNumber))){ pay in
                DispatchQueue.main.async {
                    if pay {
                        self.state.success = true
                    }else{
                        self.state.error = true
                    }
                   
                }
            }
        }
    }
}

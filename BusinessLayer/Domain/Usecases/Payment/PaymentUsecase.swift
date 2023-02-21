//
//  PaymentUseCase.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 9/02/23.
//

import Foundation


public class PaymentUsecase{
    private let paymentRepository: PaymentRepository
    
    init(paymentRepository: PaymentRepository){
        self.paymentRepository=paymentRepository
    }
    
    func pay(payment: Payment, completion: @escaping(Bool) -> Void){
        paymentRepository.pay(payment: payment){ requestResult in
            switch(requestResult){
            case .success(let data):
                print(data);
                completion(data);
            case .failure(let error):
                print(error);
                completion(false);
            }
        }
        
    }
    
}

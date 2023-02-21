//
//  PaymentFetcher.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 9/02/23.
//

import Foundation

public class PaymentFetcher: PaymentRepository {
    public static let shared = PaymentFetcher()
     init() {}
    
    func pay(payment: Payment, completion: @escaping (Result<Bool, Error>) -> Void) {
        let jsonData = try! JSONEncoder().encode(payment.mapToPaymentEntity())
        let jsonString = String(data: jsonData, encoding: .utf8)!
        print(jsonString)
        var request =  URLRequest(url: PaymentConstants.PAYMENT_PAY!)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, _ , error in
            guard let data = data, error == nil else {
                completion(.failure(CallerErrors.requestError))
                return
            }
            
            do {
                print("received data: ", data)
                let result = try JSONDecoder().decode(PaymentResponse.self, from: data)
                completion(.success(result.isPay))
            } catch let error {
                print("error decoding data: ", error)
                completion(.failure(CallerErrors.invalidDate))
            }
            
        }
        task.resume()
    }
}

//
//  LoginUsecase.swift
//  BusinessLayer
//
//  Created by Daniela Paola Beltran Saavedra on 11/02/23.
//

import Foundation

public class LoginUsecase{
    private let loginRepository: LoginRepository
    
    init(loginRepository: LoginRepository){
        self.loginRepository = loginRepository
    }
    
    func loginUser(user: User, completion: @escaping(Bool) -> Void){
        loginRepository.loginUser(user: user){ requestResult in
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

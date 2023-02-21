//
//  SiginUseCase.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 10/02/23.
//

import Foundation

public class RegisterUsecase{
    private let registerRepository: RegisterRepository
    
    init(registerRepository: RegisterRepository){
        self.registerRepository = registerRepository
    }
    
    func createUser(user: User, completion: @escaping(Bool) -> Void){
        registerRepository.createUser(user: user){ requestResult in
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

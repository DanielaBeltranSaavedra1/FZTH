//
//  LogoutUsecase.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 13/02/23.
//

import Foundation

public class LogoutUsecase{
    private let logoutRepository: LogoutRepository
    
    init(logoutRepository: LogoutRepository){
        self.logoutRepository = logoutRepository
    }
    
    func logoutUser(completion: @escaping(Bool) -> Void){
        logoutRepository.logoutUser(){ requestResult in
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

//
//  RegisterViewModel.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 9/02/23.
//

import Foundation

public class RegisterViewModel: ObservableObject{
    @Published var state: RegisterState
    private let registerRepository: RegisterUsecase
    
    init() {
        self.state = RegisterState()
        self.registerRepository = RegisterUsecase(registerRepository: AuthFetcher.shared)
    }
    func onEvet(event: SiginEvents){
        switch(event){
        case .createUser:
            registerRepository.createUser(user: User(email: state.email, password: state.password)){ register in
                    DispatchQueue.main.async {
                        if register {
                            self.state.success = true
                        }else{
                            self.state.error = true
                        }
                    }
            }
        }
    }
    func disabledButton()-> Bool {
       if state.email != "" && state.password != "" {
           return false
       }
       else{
           return true
           
       }
   }
}

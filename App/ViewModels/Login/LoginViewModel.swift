//
//  LoginViewModel.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 8/02/23.
//

import Foundation
import Firebase

public class LoginViewModel: ObservableObject{
    @Published var state: LoginState
    private let loginRepository: LoginUsecase
    
    init() {
        self.state = LoginState()
        self.loginRepository = LoginUsecase(loginRepository: AuthFetcher.shared)
    }
    func onEvet(event: LoginEvents){
        switch(event){
        case .loginUser:
            loginRepository.loginUser(user: User(email: state.email, password: state.password)){ login in
                    DispatchQueue.main.async {
                        if login {
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

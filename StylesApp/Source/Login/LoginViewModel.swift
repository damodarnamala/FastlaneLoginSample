//
//  LoginViewModel.swift
//  StylesApp
//
//  Created by Damodar Namala on 31/08/22.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var isloginSuccess = false
    @Published var loginError = ""
    @Published var isLoginError = false
    @Published var userEmail = ""

    @Published private var loginState: EventState = .initial {
        didSet {
            switch loginState {
            case .initial: ()
            case .finished:
                isloginSuccess = true
            case .loading: ()
            case .error:
                self.isLoginError = true
            }
        }
    }
    
    private var usecase: LoginUseCase
    
    var store = Set<AnyCancellable>()
    
    init(usecase: LoginUseCase = LoginUseCaseHanlder()) {
        self.usecase = usecase
    }
    
    func login(email: String, password: String) {
        if email.isEmpty || password.isEmpty {
            loginState = .error
            self.loginError = "Email and Password shouldn't be empty."
        }
        else {
            self.usecase.login(email: email, password: password)
                .sink { email in
                    self.userEmail = email
                    self.isloginSuccess = true
                }.store(in: &store)
        }
    }
    
    private
    enum EventState {
        case initial
        case loading
        case finished
        case error
    }
}

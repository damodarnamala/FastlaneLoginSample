//
//  LoginUsecase.swift
//  StylesApp
//
//  Created by Damodar Namala on 31/08/22.
//

import Foundation
import Combine

protocol LoginUseCase {
    func login(email: String, password: String) -> AnyPublisher<String, Never>
}

struct LoginUseCaseHanlder: LoginUseCase {
    
    init() {
        self.interactor = Interactor()
    }
    
    private let interactor: LoginUseCaseHanlder.Interactor
    
    func login(email: String, password: String) -> AnyPublisher<String, Never> {
        self.interactor.login(email: email, password: password)
    }
}

extension LoginUseCaseHanlder {
    private final class Interactor {
        func login(email: String, password: String) -> AnyPublisher<String, Never>  {
            return Just<String>(email).eraseToAnyPublisher()
        }
    }
}


struct MockLoginUseCaseHanlder: LoginUseCase {
    func login(email: String, password: String) -> AnyPublisher<String, Never> {
        return Just<String>(email).eraseToAnyPublisher()
    }
}

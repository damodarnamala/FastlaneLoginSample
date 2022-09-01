//
//  LoginBuilder.swift
//  StylesApp
//
//  Created by Damodar Namala on 31/08/22.
//

import Foundation

struct LoginBuilder {
    static func create() -> LoginView {
        LoginView(viewModel: LoginViewModel())
    }
}

//
//  LoginView.swift
//  StylesApp
//
//  Created by Damodar Namala on 30/08/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State var showLoginError = false
    @State var email = ""
    @State var password =  ""
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextInputView(placeholder: "Email", input: $email, accessibilityIdentifier: "email", isSecured: false)
                    
                    Divider()
                    TextInputView(placeholder: "Password", input: $password, accessibilityIdentifier: "password", isSecured: true)
                    
                    Divider()
                    
                    PrimaryButton(title: "Login", accessibilityIdentifier: "loginButton") {
                        self.viewModel.login(email: self.email, password: self.password)
                    }
                }
                .padding()
                .background(Color(.lightGray).opacity(0.2))
                .cornerRadius(8)
                
                handleError()
            }
            .padding(.horizontal)
            .navigate(to: DetailView(email: self.viewModel.userEmail), when: $viewModel.isloginSuccess)
            
        }.navigationBarHidden(true)
    }
    
    @ViewBuilder
    func handleError() -> some View {
        if $viewModel.isLoginError.wrappedValue {
            ErrorText(text: viewModel.loginError, shouldShowError: $viewModel.isLoginError)
        }
    }
}

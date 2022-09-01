//
//  LoginSpec.swift
//  StylesAppTests
//
//  Created by Damodar Namala on 31/08/22.
//

import XCTest
@testable import StylesApp
import Combine

class LoginSpec: XCTestCase {
    var loginModel = LoginViewModel(usecase: MockLoginUseCaseHanlder())
    
    override func setUp() {
        super.setUp()
    }
    
    func testLoginShouldSuccessWithValidEmailAndPassword() {
        // Arrange
        let email = "test@gmail.com"
        let password = "password"
        // Act
        loginModel.login(email: email, password: password)
        // Assert
        XCTAssertTrue(loginModel.userEmail == email, "email entered is invalid")
    }
    
    func testLoginShouldFailWithEmptyEmailAndPassword() {
        // Arrange
        let email = ""
        let password = ""
        // Act
        loginModel.login(email: email, password: password)
        // Assert
        XCTAssertTrue(loginModel.isLoginError, "email entered is invalid")
    }
}

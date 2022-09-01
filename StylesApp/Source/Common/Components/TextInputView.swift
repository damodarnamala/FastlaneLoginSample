//
//  TextInputView.swift
//  StylesApp
//
//  Created by Damodar Namala on 31/08/22.
//

import SwiftUI

struct TextInputView: View {
    let placeholder: String
    @Binding var input: String
    let accessibilityIdentifier: String
    let isSecured: Bool
    var body: some View {
        if isSecured {
            SecureField(placeholder, text: $input)
                .frame(maxWidth: .infinity, minHeight: 44,  alignment: .center)
                .accessibilityIdentifier(accessibilityIdentifier)
                .disableAutocorrection(true)
                .autocapitalization(.none)

        } else {
            TextField(placeholder, text: $input)
                .frame(maxWidth: .infinity, minHeight: 44,  alignment: .center)
                .accessibilityIdentifier(accessibilityIdentifier)
                .disableAutocorrection(true)
                .autocapitalization(.none)

        }
    }
}




struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView(placeholder: "Email", input: .constant("Entered text ... "), accessibilityIdentifier: "textInputView", isSecured: false)
    }
}

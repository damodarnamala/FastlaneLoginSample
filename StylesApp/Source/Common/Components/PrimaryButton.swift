//
//  PrimaryButton.swift
//  StylesApp
//
//  Created by Damodar Namala on 31/08/22.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    let accessibilityIdentifier: String
    let action:() -> Void
    var body: some View {
        HStack {
            Button {
                action()
            } label: {
                Text("Login")
            }.accessibilityIdentifier(accessibilityIdentifier)
        }
        .font(.headline)
        .frame(maxWidth: .infinity, minHeight: 44,  alignment: .center)
        .background(Color.red)
        .foregroundColor(.white)
        .cornerRadius(22)
        .padding(.top, 6)
    }
}




struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "", accessibilityIdentifier: "primaryButton") { }
    }
}

//
//  ErrorText.swift
//  StylesApp
//
//  Created by Damodar Namala on 31/08/22.
//

import SwiftUI

struct ErrorText: View {
    let text: String
    @Binding var shouldShowError: Bool
    
    var body: some View {
        Text(text)
            .font(.caption)
            .foregroundColor(.red)
            .padding()
            .animation(.easeInOut, value: $shouldShowError.wrappedValue)
            .transition(AnyTransition.scale.animation(.easeOut))
            .accessibilityIdentifier("errorText")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.shouldShowError = false
                }
            }
    }
}

struct ErrorText_Previews: PreviewProvider {
    static var previews: some View {
        ErrorText(text: "Error to show", shouldShowError: .constant(false))
    }
}

//
//  DetailView.swift
//  StylesApp
//
//  Created by Damodar Namala on 31/08/22.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let email: String
    
    var btnBack : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left") // set image here
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(.systemCyan))
            }
        }
        .accessibilityIdentifier("arrowLeftButton")


    }
    
    var body: some View {
        VStack {
            Text("Welcome to home..!!")
                .font(.title2)
                .foregroundColor(Color(.systemMint))
                .accessibilityIdentifier("welcomeText")
            Text(email).font(.footnote).foregroundColor(.brown)
                .accessibilityIdentifier("emailText")
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(email: "test@gmail.com")
    }
}

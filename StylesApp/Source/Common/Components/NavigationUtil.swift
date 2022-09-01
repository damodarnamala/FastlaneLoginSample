//
//  NavigationUtil.swift
//  StylesApp
//
//  Created by Damodar Namala on 31/08/22.
//

import SwiftUI
extension View {
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        ZStack {
            self
            NavigationLink(
                destination: view,
                isActive: binding
            ) {
                EmptyView()
            }
        }
    }
}

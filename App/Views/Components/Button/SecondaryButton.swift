//
//  WhiteButton.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 8/02/23.
//

import SwiftUI

struct SecondaryButton<T: View>: View {
    let action: ButtonAction<T>
    let title: String
    @State var selection: Bool = false
    var body: some View {
        Button(action: action.isDestinationEmpty ? action.onClick  : {selection = true }) {
            ZStack{
                NavigationLink(destination: action.getDestination().navigationBarHidden(true),isActive: $selection){}.opacity(0)
                Text(title)
                    .font(.bold(.title2)())
                    .foregroundColor(.white)
            }
        }.buttonStyle(MyButtonStyle())
    }
}


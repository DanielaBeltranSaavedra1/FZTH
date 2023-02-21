//
//  CustomButton.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 8/02/23.
//

import SwiftUI

struct PrimaryButton<T: View>: View {
    let action: ButtonAction<T>
    let title: String
    var color: Color = Color("Color1")
    @State var selection: Bool = false
    var disabled: Bool = false
    var body: some View {
        Button(action: action.isDestinationEmpty ? action.onClick  : {selection = true }) {
            ZStack{
                NavigationLink(destination: action.getDestination().navigationBarHidden(true),isActive: $selection){}.opacity(0)
                RoundedRectangle(cornerRadius: 10)
                    .fill(color)
                    .overlay{
                        Text(title)
                            .font(.bold(.title2)())
                            .foregroundColor(.white)
                    }
                
                    .frame(maxWidth: .infinity,maxHeight: 100, alignment: .trailing)
            }
            
        }.disabled(disabled)
            .buttonStyle(MyButtonStyle())
        
        
    }
}


struct MyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
    }
}

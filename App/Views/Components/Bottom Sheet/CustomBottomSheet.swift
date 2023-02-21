//
//  CustomBottomSheet.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 8/02/23.
//

import SwiftUI

struct CustomBottomSheet: View {
    let title: String
    let onClick: () ->Void
   
    var body: some View {
        ZStack{
            VStack {
                Spacer()
                Image("im_error")
                    .resizable()
                    .frame(width: 90, height: 90)
                Spacer()
                Text(title)
                    .font(.bold(.title)())
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .multilineTextAlignment(.center)
                
                Spacer()
                PrimaryButton(action: ButtonAction(onClick: {onClick()}), title: "Try again")
                Spacer()
            }.padding(.horizontal, 50)
            
        }.background(Color("Color"))
            .opacity(0.9)
            .frame(height: 400)
      
    }
}

//
//  WelcomeScreen.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 8/02/23.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("im_Movies")
                    .resizable()
                    .background(.black)
                    .opacity(0.5)
                    .ignoresSafeArea()
                WelcomeContentScreen()
#if os(tvOS)
                    .padding(.horizontal, 150)
                #endif
                
            }
        }.navigationBarHidden(true)
    }
}
struct WelcomeContentScreen: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 160){
                Image("logo")
                    .resizable()
#if os(tvOS)
                    .frame(width: 250,height: 250)
                
#endif
                Spacer()
                SecondaryButton(action: ButtonAction(destination: LoginScreen()), title: "LOG IN")
            }
            
            Spacer()
            Text("Unlimited movies, TV shows & more")
                .font(.bold(.title)())
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.bottom,20)
                .padding(.horizontal, 30)
            Text("Watch anywhere")
                .font(.title2)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
            PrimaryButton(action: ButtonAction(destination: RegisterScreen()), title: "GET STARTED")
                
        }.padding(.horizontal, 10)
        
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}

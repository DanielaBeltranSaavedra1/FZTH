//
//  LaunchScreen.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 7/02/23.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        Color("Color")
            .overlay(
                Image("logo")
                .padding(.top, 11)
            )
            .edgesIgnoringSafeArea(.vertical)
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}

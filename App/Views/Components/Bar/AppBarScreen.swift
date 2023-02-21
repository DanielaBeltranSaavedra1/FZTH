//
//  AppBarScreen.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 7/02/23.
//

import SwiftUI

struct AppBarScreen: View {
    @Binding var search: String
    var body: some View {
        HStack(spacing: 10){
            Button(action: {}) {
                Image("menu").renderingMode(.original)
                    
            }.buttonStyle(.plain)
            Image("logo")
              
            SearchBarScreen(search: $search)
            Button(action: {}){
                Image("Notifications").renderingMode(.original)
                   
            }.buttonStyle(.plain)
            
        }
    }
}

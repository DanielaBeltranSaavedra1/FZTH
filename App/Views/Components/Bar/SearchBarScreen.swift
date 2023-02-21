//
//  SearchBarScreen.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 7/02/23.
//

import SwiftUI

struct SearchBarScreen: View {
    @Binding var search: String
    @EnvironmentObject var viewModel: LandingViewModel
    var body: some View {
       
            TextField("Search",text: $search)
           .onChange(of: search, perform:{ value in
             viewModel.onEvent(event: .OnSearchChange(text: value))
             }).foregroundColor(.white)
                .font(.body)
                .background(Color("Color").opacity(0.9))
        
    }
}

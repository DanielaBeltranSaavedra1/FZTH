//
//  RegisterScreen.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 8/02/23.
//

import SwiftUI

struct RegisterScreen: View {
    @StateObject var viewModel: RegisterViewModel = RegisterViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var horizontalPadding: Double {
#if os(tvOS)
        return 150
#else
        return 15
#endif
    }
    var body: some View {
        NavigationView{
            ZStack {
                VStack(alignment: .leading, spacing: 20){
                    BackButton(onClick: {self.presentationMode.wrappedValue.dismiss()})
                    Spacer()
                    HStack {
                        Spacer()
                        Image("im_logoN")
                            .resizable()
                            .frame(width: 300, height: 300)
                        Spacer()
                    }
                    Spacer()
                    CustomTextField(text: $viewModel.state.email, title: "E-mail")
                        .padding(.horizontal, 100)
                    CustomTextField(text: $viewModel.state.password, title: "Password", isPassword: true)
                        .padding(.horizontal, 100)
                    Spacer()
                    PrimaryButton(action: ButtonAction(onClick:{ viewModel.onEvet(event: .createUser)}), title: "Sign In", disabled: viewModel.disabledButton())
                        .padding(.horizontal, 100)
                }.padding(.horizontal, horizontalPadding)
                    .background(Color("Color").edgesIgnoringSafeArea(.all))
                NavigationLink(destination: SubscriptionScreen().navigationBarHidden(true),isActive: .constant(viewModel.state.success)){}.opacity(0)
            }.sheet(isPresented: $viewModel.state.error){
                CustomBottomSheet(title:  "Error creating account", onClick: {viewModel.state.error = false})
                    .presentationDetents([.height(400)])
            }

        }
    }
}


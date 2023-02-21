//
//  LoginScreen.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 8/02/23.
//

import SwiftUI
import Firebase

struct LoginScreen: View {
    @StateObject var viewModel: LoginViewModel = LoginViewModel()
    @State var focus = true
    @Namespace private var namespace
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView{
            ZStack{
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
                        .prefersDefaultFocus(in: namespace)
                    CustomTextField(text: $viewModel.state.password, title: "Password", isPassword: true)
                        .padding(.horizontal, 100)
                    Spacer()
                    PrimaryButton(action: ButtonAction(onClick: {viewModel.onEvet(event: .loginUser)}), title: "Log In", disabled: viewModel.disabledButton())
                        .padding(.horizontal, 100)
                }.padding(.horizontal, 150)
                    .focusScope(namespace)
                    .background(Color("Color").edgesIgnoringSafeArea(.all))
                NavigationLink(destination: ContentView().navigationBarHidden(true),isActive: .constant(viewModel.state.success)){}.opacity(0)
            }.sheet(isPresented: $viewModel.state.error){
                CustomBottomSheet(title:  "Incorrect email or password", onClick: {viewModel.state.error = false})
                    .presentationDetents([.height(400)])
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}

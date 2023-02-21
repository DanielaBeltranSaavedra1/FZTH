//
//  SubscriptionScreen.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 9/02/23.
//

import SwiftUI

struct SubscriptionScreen: View {
    @StateObject var viewModel: SubscriptionViewModel = SubscriptionViewModel()
    var body: some View {
        NavigationView{
            ZStack {
                VStack(alignment: .leading) {
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Subscription Plan")
                            .foregroundColor(.white)
                            .font(.bold(.title)())
                        Spacer()
                    }
                    Spacer()
                    HStack{
#if os(tvOS)
                        Spacer()
                        #endif
                        Button(action: {viewModel.onEvet(event: SubscriptionEvents.selectSubscription(subscription: .BASIC))}){
                            SubscriptionCardScreen(subscription: Subscription(type: Subscription.Subscriptions.BASIC), onClick: $viewModel.state.selectBasic)
                        }.buttonStyle(MyButtonStyle())
                            
                        Spacer()
                        Button(action: {viewModel.onEvet(event: SubscriptionEvents.selectSubscription(subscription: .ADVANCED))}){
                            SubscriptionCardScreen(subscription: Subscription(type: Subscription.Subscriptions.ADVANCED), onClick:$viewModel.state.selectAdvanced)
                        }.buttonStyle(MyButtonStyle())
#if os(tvOS)
                        Spacer()
                        #endif
                    }
                    
                    Spacer()
                    HStack{
                        Spacer()
                        Text("Payment information")
                            .foregroundColor(.white)
                            .font(.bold(.title2)())
                        Spacer()
                    }
                    VStack {
                        CustomTextField(text: $viewModel.state.cardNumber, title: "Card Number", imageName: "creditcard")
                            .padding(.horizontal, 30)
                        CustomTextField(text:  $viewModel.state.cardOwner, title: "Card Owner Name", imageName: "person")
                            .padding(.horizontal, 30)
                    }
                    HStack{
                        CustomTextField(text: $viewModel.state.cvvNumber, title: "CVV", imageName: "")
                        CustomTextField(text: $viewModel.state.dateNumber, title: "MM/YY", imageName: "")
                            
                    }.padding(.horizontal, 30)
                    Spacer()
                    PrimaryButton(action: ButtonAction(onClick: {viewModel.onEvet(event: .purchase)}), title: "Purchase")
                    
                }.padding(.horizontal, 10)
                NavigationLink(destination: ContentView().navigationBarHidden(true),isActive: .constant(viewModel.state.success)){}.opacity(0)
            }
#if os(tvOS)
            .padding(.horizontal, 50)
            #endif
            .background(.black.opacity(0.9))
            .sheet(isPresented: $viewModel.state.error){
                CustomBottomSheet(title:  "Something went wrong", onClick: {viewModel.state.error = false})
                    .presentationDetents([.height(400)])
            }
        }
    }
        
}


struct SubscriptionCardScreen: View {
    let subscription: Subscription
    @Binding var onClick: Bool
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .stroke(.white.opacity(onClick ? 1.0 : 0.4), lineWidth: 3)
#if os(tvOS)
            .frame(width:487,height: 330)
#endif
#if os(iOS)
            .frame(width:187,height: 230)
#endif
            .overlay{
                VStack(alignment: .center, spacing: 20){
                    HStack(alignment: .center){
                        Image(systemName: iconName)
                            .resizable()
#if os(tvOS)
                            .frame(width:45, height: 45)
#endif
#if os(iOS)
                            .frame(width:25, height: 25)
#endif
                            .foregroundColor(textColor)
                        
                        Text(subscription.type.rawValue)
                            .font(.bold(.title)())
                    }.padding(.top, 10)
                    HStack(alignment: .top,spacing: 10) {
                        Image(systemName: "checkmark.circle")
                        //.foregroundColor(Color("Color1"))
                        Text(subscription.information[0])
                            .font(.body)
                    }
                    
                    Text("$"+String(subscription.price))
                        .foregroundColor(textColor)
                        .font(.bold(.title)())
                }.foregroundColor(.white)
                    .padding(.trailing, 10)
                
            }
    }
    private var textColor: Color {
        switch subscription.type {
        case .BASIC:
            return Color(.systemCyan)
        case .ADVANCED:
            return Color(.systemYellow)
        }
    }
    private var iconName: String {
        switch subscription.type {
        case .BASIC:
            return "tag.circle"
        case .ADVANCED:
            return "crown"
        }
    }
    
}


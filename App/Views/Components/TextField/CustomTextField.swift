//
//  CustomTextField.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 8/02/23.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let title: String
    var isPassword: Bool = false
    var eventChangeValue: () -> Void = {}
    var imageName: String = ""
    var body: some View {
        HStack{
            if isPassword {
                SecureField(title,
                            text: $text)
                .background(.white)
                .onChange(of: text, perform:{ _ in
                    eventChangeValue()})
                
            }else{
                TextField(title,text:$text )
                    .background(.white)
                    .onChange(of: text, perform:{ _ in
                        eventChangeValue()})
            }
        }.foregroundColor(.black)
            .font(.body)
            .frame(height: 60)
    }
}

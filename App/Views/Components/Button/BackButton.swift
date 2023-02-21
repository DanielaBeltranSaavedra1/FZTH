//
//  BackButton.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 8/02/23.
//

import SwiftUI

struct BackButton: View {
    let onClick:  () -> Void
    var size: Double {
#if os(tvOS)
        return 80
#else
        return 40
#endif
    }
    var body: some View {
        Button(action: {onClick()}){
            Image("ic_backArrow")
                .resizable()
                .frame(width: size, height: size)
        }.buttonStyle(MyButtonStyle())
    }
}

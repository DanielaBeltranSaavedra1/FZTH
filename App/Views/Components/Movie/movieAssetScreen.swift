//
//  l.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 7/02/23.
//

import SwiftUI

struct movieAssetScreen: View {
    let movie: Movie
    var width: Double = 200
    var height: Double = 100
    @State var showwDetail = false
    @State var playVideo: Bool = false
    let onClick: () -> Void
    var body: some View{
            Button(action: {showwDetail = true
                onClick()}){
                    ZStack(alignment: .leading){
                        NavigationLink(destination:  PlayerView(movie: movie).navigationBarHidden(true),isActive: .constant(playVideo)){}.opacity(0)
              
                        AsyncImage(
                            url: URL(string: movie.thumbnailURL),
                            content: { image in image.resizable().aspectRatio(contentMode: .fill) },
                            placeholder: { ProgressView() }
                        ).frame(height: height)
                        VStack(alignment: .leading) {
                            Spacer()
                            Text(movie.title)
                                .font(.body)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.horizontal,2)
                        }
                    }.frame(minWidth: width, maxWidth: .infinity)
                        .sheet(isPresented: $showwDetail){
                            movieDetailScreen(movie: movie, showwDetail: $showwDetail, playVideo: $playVideo)
                                .presentationDetents([.height(300)])
                        }
                    
                }.buttonStyle(.plain)
    }
}

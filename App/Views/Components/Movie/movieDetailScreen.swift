//
//  movieDetailScreen.swift
//  App
//
//  Created by Daniela Paola Beltran Saavedra on 8/02/23.
//

import SwiftUI

struct movieDetailScreen: View {
    let movie: Movie
    @Binding var showwDetail: Bool
    var height: Int = 0
    @Binding var playVideo: Bool
    var body: some View{
            GeometryReader { proxy in
                ZStack(alignment: .bottom) {
                    VStack(alignment: .trailing) {
                    Button(action:{showwDetail = false}){
                            Image(systemName: "multiply")
                        }.padding([.trailing, .top],15)
                        HStack(spacing: 10){
                                    ZStack(alignment: .center) {
                                        AsyncImage(
                                            url: URL(string: movie.thumbnailURL),
                                            content: { image in image.resizable().aspectRatio(contentMode: .fit) },
                                            placeholder: { ProgressView() }
                                        )
                                        Button(action:{playVideo = true; showwDetail = false }){
                                            Image("playbig")
                                        }
                                    }
                                .padding(.top, 20)
                            
                            VStack(alignment: .leading){
                                Text(movie.title)
                                    .font(.body)
                                HStack {
                                    Text(String(movie.voteAverage))
                                        .foregroundColor(.red)
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(.gray.opacity(3))
                                        .overlay{
                                            Text(movie.adult ? "18+": "All")
                                                .foregroundColor(.white)
                                        }
                                        .frame(width: 30, height: 25)
                                    Text(getYear(releaseDate:movie.releaseDate))
                                    
                                }.font(Font.caption)
#if os(tvOS)
                                Text(movie.overview)
                                    .font(Font.caption)
#endif
                            }
                            Spacer()
                            
                        }
#if os(iOS)
                        Text(movie.overview)
                            .font(Font.caption)
                        Spacer()
#endif
                    }.padding(.bottom, 20)
                        .padding(.horizontal, 10)
                    Spacer()
                }.background(Color("Color").ignoresSafeArea())
                    .foregroundColor(.white)
                
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    .ignoresSafeArea()
            }
    }
    private func getYear(releaseDate: String?) -> String{
        guard let date = releaseDate else {
            return ""
        }
        let year = date.components(separatedBy: "-")
        return year[0]
    }
}

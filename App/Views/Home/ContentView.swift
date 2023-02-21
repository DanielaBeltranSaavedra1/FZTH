//
//  ContentView.swift
//  App
//
//  Created by Fager Alejandro Barh Solis on 7/02/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: LandingViewModel
    var body: some View {
        ZStack {
            Home()
        }.background( Color.black.edgesIgnoringSafeArea(.all))
            .onAppear{
                viewModel.onEvent(event: .ScreenLoaded)
            }
    }
}


struct Home: View {
    @EnvironmentObject var viewModel: LandingViewModel
    @State var search: String = ""
    var body: some View {
        NavigationView{
            VStack {
                AppBarScreen(search: $search)
                
                if search == "" {
                    ScrollView(.vertical){
                        TrendingView(movie: viewModel.state.trendingMovie)
                        
                        GenderCarouselView(title: "Action", movies: viewModel.state.actionMovies)
                        
                        GenderCarouselView(title: "Comedy", movies: viewModel.state.comedyMovies)
                        
                        GenderCarouselView(title: "Romance",movies: viewModel.state.romanceMovies)
                        
                        GenderCarouselView(title: "Top Rated", movies: viewModel.state.topRatedMovies)
                        
                        GenderCarouselView(title: "Documentaries", movies: viewModel.state.documentariesMovies)
                        
                    }
                    
                }else{
                    SearchScreen(movies: viewModel.state.searchMovies)
                }
                
                Spacer()
            }.padding(.horizontal,5)
                .preferredColorScheme(.dark)
        }
    }
}
struct SearchScreen: View {
    @EnvironmentObject var viewModel: LandingViewModel
    var movies: [Movie]
    var gridItemLayout: [GridItem] {
#if os(tvOS)
        return [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())]
#else
        return [GridItem(.flexible()), GridItem(.flexible())]
#endif
    }
    var width: Double {
#if os(tvOS)
        return 200
#else
        return 100
#endif
    }
    var height: Double {
#if os(tvOS)
        return 200
#else
        return 100
#endif
    }
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: gridItemLayout, spacing: 25) {
                ForEach(movies, id: \.id) { movie in
                    movieAssetScreen(movie: movie, width: width , height: height, onClick: { viewModel.movieOnEvent(event: .DetailMovie(id: movie.id))})
                }
            }
        }
    }
}

struct TrendingView: View{
    var movie: Movie? = nil
    @State var showwDetail: Bool = false
    @State var playVideo: Bool = false
    @EnvironmentObject var viewModel: LandingViewModel
    var body: some View {
        if let movie = movie {
            
            VStack(alignment: .leading, spacing: 15){
                Text("Trending").font(.title).foregroundColor(.white)
#if os(tvOS)
                    .focusable(true)
#endif
                ZStack(alignment: .leading){
                    NavigationLink(destination:  PlayerView(movie: movie).navigationBarHidden(true),isActive: .constant(playVideo)){}.opacity(0)
          
                            Button(action:{showwDetail = true
                        viewModel.movieOnEvent(event: .DetailMovie(id: movie.id))}){
                            AsyncImage(
                                url: URL(string: movie.thumbnailURL),
                                content: {image in image.resizable().aspectRatio(contentMode: .fill)},
                                placeholder: { ProgressView() }
                            )
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.plain)    
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.body)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        Spacer()
                    }.padding(.trailing, 90)
                }.sheet(isPresented: $showwDetail){
#if os(tvOS)
                    movieDetailScreen(movie: movie, showwDetail: $showwDetail, playVideo: $playVideo)
#else
                    movieDetailScreen(movie: movie, showwDetail: $showwDetail, playVideo: $playVideo)
                        .presentationDetents([.height(300)])
#endif
                }
            }
            HStack{
                Spacer()
                Button(action: {}){
                    Text("View all")
                }.foregroundColor(Color("Color1"))
                    .buttonStyle(.plain)
            }
        }
    }
}

struct GenderCarouselView: View {
    let title: String
    var movies: [Movie]
    var width: Double {
#if os(tvOS)
        return 400
#else
        return 200
#endif
    }
    var height: Double {
#if os(tvOS)
        return 200
#else
        return 100
#endif
    }
    @EnvironmentObject var viewModel: LandingViewModel
    var body: some View{
        
        VStack(alignment: .leading, spacing: 15){
            Text(title).font(.title).foregroundColor(.white)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    ForEach(movies, id: \.id) { movie in
                        movieAssetScreen(movie: movie, width: width, height: height, onClick: { viewModel.movieOnEvent(event: .DetailMovie(id: movie.id))})
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let landingViewModel = LandingViewModel()
        ContentView()
            .environmentObject(landingViewModel)
    }
}

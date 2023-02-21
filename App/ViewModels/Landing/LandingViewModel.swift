//
//  LandingViewModel.swift
//  App
//
//  Created by Fager Alejandro Barh Solis on 7/02/23.
//

import Foundation

public class LandingViewModel: ObservableObject{
    private let movieUsecase: MovieUsecase
    private let searchUsecase: SearchUsecase
    @Published var state: LadingState
    
    init() {
        self.movieUsecase = MovieUsecase(movieRepository: TMDBFetcher.shared)
        self.searchUsecase = SearchUsecase(movieRepository: TMDBFetcher.shared)
        self.state = LadingState()
    }
    func onEvent(event: LandingEvents){
        switch(event){
        case .ScreenLoaded:
            movieUsecase.getByGender(gender: .TRENDING){ movies in
                DispatchQueue.main.async {
                    self.state.trendingMovie = movies.randomElement()
                }
            }
            movieUsecase.getByGender(gender: .COMEDY) { movies in
                DispatchQueue.main.async {
                    self.state.comedyMovies = movies
                }
            }
            movieUsecase.getByGender(gender: .ACTION) { movies in
                DispatchQueue.main.async {
                    self.state.actionMovies = movies
                }
            }
            movieUsecase.getByGender(gender: .TOP_RATED) { movies in
                DispatchQueue.main.async {
                    self.state.topRatedMovies = movies
                }
            }
            movieUsecase.getByGender(gender: .HORROR) { movies in
                DispatchQueue.main.async {
                    self.state.horrorMovies = movies
                }
            }
            movieUsecase.getByGender(gender: .DOCUMENTARIES) { movies in
                DispatchQueue.main.async {
                    self.state.documentariesMovies = movies
                }
            }
            movieUsecase.getByGender(gender:.ROMANCE) { movies in
                DispatchQueue.main.async {
                    self.state.romanceMovies = movies
                }
            }
        case .OnSearchChange(text: let text):
            self.searchUsecase.getBySearch(searchText:  text) { movies in
                DispatchQueue.main.async {
                    self.state.searchMovies = movies
                }
            }
        }
    }
    func movieOnEvent(event: MovieEvents){
        switch (event){
        case .DetailMovie(id: let id):
            self.state.onClickMovie = id
        }
    }
}

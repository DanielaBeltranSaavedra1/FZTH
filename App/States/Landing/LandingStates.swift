//
//  LandingStates.swift
//  App
//
//  Created by Fager Alejandro Barh Solis on 7/02/23.
//

import Foundation

public struct LadingState{
    var trendingMovie: Movie? = nil
    var comedyMovies: [Movie] = []
    var actionMovies: [Movie] = []
    var topRatedMovies: [Movie] = []
    var horrorMovies: [Movie] = []
    var documentariesMovies: [Movie] = []
    var romanceMovies: [Movie] = []
    var searchMovies: [Movie] = []
    var searchText: String = ""
    var onClickMovie: Int = 0
}

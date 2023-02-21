//
//  TMDBConstants.swift
//  BusinessLayer
//
//  Created by Fager Alejandro Barh Solis on 7/02/23.
//

import Foundation

struct TMDBConstants{
    private static let TMDB_API_KEY = "e9e93fc4034386599d3fee2bfc1c7cd7"
    private static let TMDB_BASE_URL = "https://api.themoviedb.org/3/"
    static let TMDB_THUMBNAIL_URL = "https://image.tmdb.org/t/p/w500"
    static let TMDB_POSTER_URL = "https://image.tmdb.org/t/p/original/"
    
    static let TMDB_TRENDING = URL(string: TMDB_BASE_URL + "trending/all/week?api_key=" + TMDB_API_KEY + "&language=en-US")
    
    static let TMDB_ACTION = URL(string: TMDB_BASE_URL + "discover/movie?api_key=" + TMDB_API_KEY + "&language=en-US&with_genres=28")
    
    static let TMDB_TOP_RATED = URL(string: TMDB_BASE_URL + "movie/top_rated?api_key=" + TMDB_API_KEY + "&language=en-US")
    
    static let TMDB_COMEDY = URL(string: TMDB_BASE_URL + "discover/movie?api_key=" + TMDB_API_KEY + "&language=en-US&with_genres=35")
    
    static let TMDB_HORROR = URL(string: TMDB_BASE_URL + "discover/movie?api_key=" + TMDB_API_KEY + "&language=en-US&with_genres=27")
    
    static let TMDB_ROMANCE = URL(string: TMDB_BASE_URL + "discover/movie?api_key=" + TMDB_API_KEY + "&language=en-US&with_genres=10749")
    
    static let TMDB_DOCUMENTARIES = URL(string: TMDB_BASE_URL + "discover/movie?api_key=" + TMDB_API_KEY + "&language=en-US&with_genres=99")
    
    static let TMDB_SEARCH = TMDB_BASE_URL + "search/multi?api_key=" + TMDB_API_KEY + "&language=en-US&page=1&query="
}

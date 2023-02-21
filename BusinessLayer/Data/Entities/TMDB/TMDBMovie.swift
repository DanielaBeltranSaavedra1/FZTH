//
//  TMDBMovie.swift
//  BusinessLayer
//
//  Created by Fager Alejandro Barh Solis on 7/02/23.
//

import Foundation

struct TMDBMovie: Codable {
    let adult: Bool
    let title: String?
    let backdropPath: String?
    let mediaType: String?
    let releaseDate: String?
    let firstAirDate: String?
    let genreIds: [Int]
    let name: String?
    let originCountry: [String]?
    let id: Int
    let originalLanguage: String
    let originalName: String?
    let overview: String
    let popularity: Float
    let posterPath: String
    let voteAverage: Float
    let voteCount: Int
    
    enum CodingKeys : String, CodingKey {
        case adult = "adult"
        case title = "title"
        case backdropPath = "backdrop_path"
        case mediaType =  "media_type"
        case releaseDate = "release_date"
        case firstAirDate = "first_air_date"
        case genreIds = "genre_ids"
        case name = "name"
        case originCountry = "origin_country"
        case id = "id"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

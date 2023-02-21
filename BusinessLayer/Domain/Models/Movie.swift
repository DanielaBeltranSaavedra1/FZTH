//
//  Movie.swift
//  BusinessLayer
//
//  Created by Fager Alejandro Barh Solis on 7/02/23.
//

import Foundation

struct Movie{
    
    let id: Int
    let title: String
    let mediaType: String?
    let releaseDate: String?
    let firstAirDate: String?
    let originCountry: [String]?
    let originalLanguage: String
    let originalName: String?
    let overview: String
    let popularity: Float
    let voteAverage: Float
    let voteCount: Int
    let thumbnailURL: String
    let posterURL: String
    let adult: Bool
    
    public enum Genders{
        case TRENDING
        case TOP_RATED
        case ACTION
        case COMEDY
        case HORROR
        case ROMANCE
        case DOCUMENTARIES
    }
    
    public init(
        id: Int,
        title: String,
        mediaType: String? = nil,
        releaseDate: String? = nil,
        firstAirDate: String? = nil,
        originCountry: [String]? = nil,
        originalLanguage: String,
        originalName: String? = nil,
        overview: String,
        popularity: Float,
        voteAverage: Float,
        voteCount: Int,
        thumbnailURL: String,
        posterURL: String,
        adult: Bool) {
            self.id = id
            self.title = title
            self.mediaType = mediaType
            self.releaseDate = releaseDate
            self.firstAirDate = firstAirDate
            self.originCountry = originCountry
            self.originalLanguage = originalLanguage
            self.originalName = originalName
            self.overview = overview
            self.popularity = popularity
            self.voteAverage = voteAverage
            self.voteCount = voteCount
            self.thumbnailURL = thumbnailURL
            self.posterURL = posterURL
            self.adult = adult
        }
}

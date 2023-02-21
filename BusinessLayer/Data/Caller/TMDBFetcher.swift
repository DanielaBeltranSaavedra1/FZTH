//
//  TMDBFetcher.swift
//  BusinessLayer
//
//  Created by Fager Alejandro Barh Solis on 7/02/23.
//

import Foundation

public class TMDBFetcher: MovieRepository {
    public static let shared = TMDBFetcher()
    
    private init() {}
    func getBySearch(searchText: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let url = URL(string: "\(TMDBConstants.TMDB_SEARCH)\(searchText.replacingOccurrences(of: " ", with: "+"))")!
    
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data, error == nil else {
                completion(.failure(CallerErrors.requestError))
                return
            }
            
            do {
                print("received data: ", data)
                let result = try JSONDecoder().decode(TMDBResponse.self, from: data)
                completion(.success(result.results.map({ TMDBMovie in
                    Movie(
                        id: TMDBMovie.id,
                        title: TMDBMovie.title == nil ? TMDBMovie.name!: TMDBMovie.title!,
                        mediaType: TMDBMovie.mediaType,
                        releaseDate: TMDBMovie.releaseDate,
                        firstAirDate: TMDBMovie.firstAirDate,
                        originCountry: TMDBMovie.originCountry,
                        originalLanguage: TMDBMovie.originalLanguage,
                        originalName: TMDBMovie.originalName,
                        overview: TMDBMovie.overview,
                        popularity: TMDBMovie.popularity,
                        voteAverage: TMDBMovie.voteAverage,
                        voteCount: TMDBMovie.voteCount,
                        thumbnailURL: TMDBMovie.backdropPath == nil ? TMDBConstants.TMDB_THUMBNAIL_URL + TMDBMovie.posterPath : TMDBConstants.TMDB_THUMBNAIL_URL + TMDBMovie.backdropPath!,
                        posterURL: TMDBMovie.backdropPath == nil ? TMDBConstants.TMDB_POSTER_URL + TMDBMovie.posterPath : TMDBConstants.TMDB_POSTER_URL + TMDBMovie.backdropPath!,
                        adult: TMDBMovie.adult
                    )
                })))
            } catch let error {
                print("error decoding data: ", error)
                completion(.failure(CallerErrors.invalidDate))
            }
            
        }
        task.resume()
    }
    func getByGender(gender: Movie.Genders, completion: @escaping (Result<[Movie], Error>) -> Void) {
        var url: URL
        switch(gender){
        case .TRENDING:
            url = TMDBConstants.TMDB_TRENDING!
        case .TOP_RATED:
            url = TMDBConstants.TMDB_TOP_RATED!
        case .ACTION:
            url = TMDBConstants.TMDB_ACTION!
        case .COMEDY:
            url = TMDBConstants.TMDB_COMEDY!
        case .HORROR:
            url = TMDBConstants.TMDB_HORROR!
        case .ROMANCE:
            url = TMDBConstants.TMDB_ROMANCE!
        case .DOCUMENTARIES:
            url = TMDBConstants.TMDB_DOCUMENTARIES!
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _ , error in
            guard let data = data, error == nil else {
                completion(.failure(CallerErrors.requestError))
                return
            }
            
            do {
                print("received data: ", data)
                let result = try JSONDecoder().decode(TMDBResponse.self, from: data)
                completion(.success(result.results.map({ TMDBMovie in
                    Movie(
                        id: TMDBMovie.id,
                        title: TMDBMovie.title == nil ? TMDBMovie.name!: TMDBMovie.title!,
                        mediaType: TMDBMovie.mediaType,
                        releaseDate: TMDBMovie.releaseDate,
                        firstAirDate: TMDBMovie.firstAirDate,
                        originCountry: TMDBMovie.originCountry,
                        originalLanguage: TMDBMovie.originalLanguage,
                        originalName: TMDBMovie.originalName,
                        overview: TMDBMovie.overview,
                        popularity: TMDBMovie.popularity,
                        voteAverage: TMDBMovie.voteAverage,
                        voteCount: TMDBMovie.voteCount,
                        thumbnailURL: TMDBMovie.backdropPath == nil ? TMDBConstants.TMDB_THUMBNAIL_URL + TMDBMovie.posterPath : TMDBConstants.TMDB_THUMBNAIL_URL + TMDBMovie.backdropPath!,
                        posterURL: TMDBMovie.backdropPath == nil ? TMDBConstants.TMDB_POSTER_URL + TMDBMovie.posterPath : TMDBConstants.TMDB_POSTER_URL + TMDBMovie.backdropPath!,
                        adult: TMDBMovie.adult
                    )
                })))
            } catch let error {
                print("error decoding data: ", error)
                completion(.failure(CallerErrors.invalidDate))
            }
        }
        task.resume()
    }
}

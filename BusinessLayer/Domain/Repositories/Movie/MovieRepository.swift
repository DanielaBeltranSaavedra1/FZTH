//
//  MovieRepository.swift
//  BusinessLayer
//
//  Created by Fager Alejandro Barh Solis on 7/02/23.
//

import Foundation

protocol MovieRepository {
    func getByGender(gender: Movie.Genders, completion: @escaping(Result<[Movie], Error>) -> Void)
    func getBySearch(searchText: String, completion: @escaping(Result<[Movie], Error>) -> Void)
}

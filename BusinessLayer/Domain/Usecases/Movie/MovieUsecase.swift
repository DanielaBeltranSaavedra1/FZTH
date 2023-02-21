//
//  MovieUsecase.swift
//  BusinessLayer
//
//  Created by Fager Alejandro Barh Solis on 7/02/23.
//

import Foundation

public class MovieUsecase{
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository){
        self.movieRepository=movieRepository
    }
    
    func getByGender(gender: Movie.Genders, completion: @escaping([Movie]) -> Void){
        movieRepository.getByGender(gender: gender){ requestResult in
            switch(requestResult){
            case .success(let data):
                print(data);
                completion(data);
            case .failure(let error):
                print(error);
                completion([]);
            }
        }
    }
}

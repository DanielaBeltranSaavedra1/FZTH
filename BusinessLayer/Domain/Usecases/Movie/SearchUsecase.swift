//
//  SearchUsecase.swift
//  FZTH
//
//  Created by Daniela Paola Beltran Saavedra on 11/02/23.
//

import Foundation


public class SearchUsecase{
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository){
        self.movieRepository = movieRepository
    }
    
    func getBySearch(searchText: String, completion: @escaping([Movie]) -> Void){
        movieRepository.getBySearch(searchText: searchText){ requestResult in
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

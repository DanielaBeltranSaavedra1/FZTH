//
//  TMDBResponse.swift
//  BusinessLayer
//
//  Created by Fager Alejandro Barh Solis on 7/02/23.
//

import Foundation

struct TMDBResponse: Codable {
    let page: Int
    let results: [TMDBMovie]
    let totalPage: Int
    let totalResults: Int
    
    enum CodingKeys : String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPage =  "total_pages"
        case totalResults = "total_results"
    }
}

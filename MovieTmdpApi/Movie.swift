//
//  Movie.swift
//  MovieTmdpApi
//
//  Created by Talha Batuhan Irmalı on 24.01.2023.
//

import Foundation

struct MovieData: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
    
}

struct Movie: Decodable {
    let title: String?
    let year: String?
    let rate: Double?
    let posterImage: String?
    let backdropImage: String?
    let overview: String?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case overview
        case year = "release_date"
        case rate = "vore_average"
        case posterImage = "poster_path"
        case backdropImage = "backdrop_path"
    }
}

//
//  Movie.swift
//  MobDev
//
//  Created by POG on 28.11.2020.
//

import Foundation

struct Movie: Codable{
    let title: String
    let categories: [String]
    let duration: String
    let rating: Double
    let summary: String
    let imageName: String
    let year: String
    let type: String
    let rated: String
    let released: String
    let director: String
    let writer: String
    let actors: String
    let language: String
    let country: String
    let awards: String
    let imdbVotes: String
    let production: String
    
    var imageSmall: String{
        return imageName + "-small.jpg"
    }
    
    var imageWide: String{
        return imageName + "-wide.jpg"
    }
    
    var categoriesDescription: String{
        return categories.joined(separator: " | ")
    }
    
    enum CodingKeys: String, CodingKey{
        case title
        case categories
        case duration
        case rating
        case summary
        case imageName = "image_name"
        case year
        case type
        case rated
        case released
        case director
        case writer
        case actors
        case language
        case country
        case awards
        case imdbVotes
        case production
    }
}

//
//  Recipes.swift
//  CoudrietFetchDemo
//
//  Created by Christopher Coudriet on 12/23/24.
//

import Foundation

struct Recipes: Codable {
    
    let recipes: [RecipeData]
    
    enum CodingKeys: String, CodingKey {
        case recipes = "recipes"
    }
}

struct RecipeData: Codable, Identifiable {
    
    let cuisine: String
    let name: String
    let photo_url_large: String?
    let photo_url_small: String?
    let source_url: String?
    let id: String
    let youtube_url: String?
    
    enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case photo_url_large
        case photo_url_small
        case source_url
        case youtube_url
        case id = "uuid"
    }
}

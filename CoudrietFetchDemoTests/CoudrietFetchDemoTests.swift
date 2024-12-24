//
//  CoudrietFetchDemoTests.swift
//  CoudrietFetchDemoTests
//
//  Created by Christopher Coudriet on 12/23/24.
//

import Testing
import Foundation
import SwiftUI

@testable import CoudrietFetchDemo

struct CoudrietFetchDemoTests {
    
    @Test func recipeModelTypesValidation() async throws {
        
        let recipe = RecipeData(cuisine: "American", name: "Hamburger", photo_url_large: nil, photo_url_small: "www.testsmall.com", source_url: "besthamburgerever.com", id: "1234567890", youtube_url: nil)
        
        #expect(recipe.id == "1234567890")
        #expect(recipe.cuisine == "American")
        #expect(recipe.name == "Hamburger")
        #expect(recipe.photo_url_large == nil)
        #expect(recipe.photo_url_small == "www.testsmall.com")
        #expect(recipe.source_url == "besthamburgerever.com")
        #expect(recipe.youtube_url == nil)
    }
    
    @Test func recipeModelTypesValidationWithYoutubeUrl() async throws {
        
        let recipe = RecipeData(cuisine: "American", name: "Hamburger", photo_url_large: "www.testlarge.com", photo_url_small: "www.testsmall.com", source_url: "besthamburgerever.com", id: "1234567890", youtube_url: "http.youtube.com")
        
        #expect(recipe.id == "1234567890")
        #expect(recipe.cuisine == "American")
        #expect(recipe.name == "Hamburger")
        #expect(recipe.photo_url_large == "www.testlarge.com")
        #expect(recipe.photo_url_small == "www.testsmall.com")
        #expect(recipe.source_url == "besthamburgerever.com")
        #expect(recipe.youtube_url == "http.youtube.com")
    }
}

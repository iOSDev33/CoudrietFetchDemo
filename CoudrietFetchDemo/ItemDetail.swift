//
//  ItemDetail.swift
//  CoudrietFetchDemo
//
//  Created by Christopher Coudriet on 12/23/24.
//

import SwiftUI

struct ItemDetail: View {
    
    let recipe: RecipeData
    
    var body: some View {
        VStack {
            List {
                ImageHandler(url: URL(string:recipe.photo_url_large ?? "")) { image in
                    image
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 300, height: 300)
                
                Text(recipe.cuisine)
               
                if recipe.source_url != nil {
                    Text(recipe.source_url ?? "")
                }
                if recipe.youtube_url != nil {
                    Text(recipe.youtube_url ?? "")
                }
            }
        }
        .navigationTitle(recipe.name)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let recipe = RecipeData(cuisine: "British", name: "Apple & Blackberry Crumble", photo_url_large: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg", photo_url_small: "www.testsmall.com", source_url: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble", id: "1234567890", youtube_url: nil)
        
        ItemDetail(recipe: recipe)
    }
}

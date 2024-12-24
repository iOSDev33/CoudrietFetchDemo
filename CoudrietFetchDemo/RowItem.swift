//
//  RowItem.swift
//  CoudrietFetchDemo
//
//  Created by Christopher Coudriet on 12/23/24.
//

import SwiftUI

struct RowItem: View {
    
    let recipe: RecipeData
    
    var body: some View {
        HStack {
            ImageHandler(url: URL(string:recipe.photo_url_small ?? "")) { image in
                image
            } placeholder: {
                ProgressView()
            }
            .frame(width: 80, height: 80)
            .clipShape(.circle)
            .padding(.trailing, 20)
            
            VStack(alignment: .leading){
                Text(recipe.name).font(.headline)
                Text(recipe.cuisine)
            }
        }
    }
}

struct RowItem_Previews: PreviewProvider {
    static var previews: some View {
        
        let recipe = RecipeData(cuisine: "British", name: "Apple & Blackberry Crumble", photo_url_large: "www.testlarge.com", photo_url_small: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg", source_url: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble", id: "1234567890", youtube_url: nil)
        
        RowItem(recipe: recipe)
    }
}

//
//  ContentView.swift
//  CoudrietFetchDemo
//
//  Created by Christopher Coudriet on 12/23/24.
//

import SwiftUI

struct ContentView: View {
    @State var recipes = [RecipeData]()
    @State var malformedData: Bool = false
    
    func getRandomDataUrl() async -> String {
        
        // Empty List
        // https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json
        // Malformed
        // https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json
        // Prod
        // https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json
        
        let randomURLArray = ["https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json", "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json", "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"]
        
        return randomURLArray.randomElement()!
    }
    
    func getData() async {
        do {
            let urlString = await getRandomDataUrl()
            let url = URL(string: urlString)!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            let decodeData = try decoder.decode(Recipes.self, from: data)
            self.recipes = decodeData.recipes
            malformedData = false
        } catch {
            print("Oops! Something went wrong: \(error)")
            malformedData = true
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(recipes) { recipe in
                    NavigationLink {
                        ItemDetail(recipe: recipe)
                    } label: {
                        RowItem(recipe: recipe)
                    }
                }
            }
            .overlay(Group {
                if recipes.isEmpty {
                    Text(malformedData ? "Oops looks like the data recieved was malformed JSON data." : "Oops, Looks like there are no recipes available at this time.").padding(.horizontal, 75).multilineTextAlignment(.center)
                }
            })
            .refreshable {
                print("Did refresh")
                await getData()
            }
            .task {
                await getData()
            }
            .navigationTitle("Recipes")
            
        } detail: {
            Text("Select an item")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 

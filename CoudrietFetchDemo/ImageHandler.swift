//
//  ImageHandler.swift
//  CoudrietFetchDemo
//
//  Created by Christopher Coudriet on 12/23/24.
//

import SwiftUI

struct ImageHandler <ImageView: View, PlaceholderView: View>: View {
    
    var url: URL?
    @ViewBuilder var fecthedImage: (Image) -> ImageView
    @ViewBuilder var placeholder: () -> PlaceholderView
    
    @State var image: UIImage? = nil
    
    init(
        url: URL?,
        @ViewBuilder fecthedImage: @escaping (Image) -> ImageView,
        @ViewBuilder placeholder: @escaping () -> PlaceholderView
    ) {
        self.url = url
        self.fecthedImage = fecthedImage
        self.placeholder = placeholder
        self.image = image
    }
    var body: some View {
        if let uiImage = image {
            fecthedImage(Image(uiImage: uiImage))
        }
        else {
            placeholder()
            .onAppear() {
                Task {
                    image = await downloadPhoto()
                }
            }
        }
    }
    
    public func downloadPhoto() async -> UIImage? {
        do {
            guard let url else { return nil }
            if let cachedResponse = URLCache.shared.cachedResponse(for: .init(url: url)) {
                print("Image found in cache \(url)")
                return UIImage(data: cachedResponse.data)
            } else {
                let (data, response) = try await URLSession.shared.data(from: url)
                URLCache.shared.storeCachedResponse(.init(response: response, data: data), for: .init(url: url))
                guard let image = UIImage(data: data) else {
                    return nil
                }
                print("Image cached in cache \(url)")
                return image
            }
        } catch {
            print("Error downloading: \(error)")
            return nil
        }
    }
}

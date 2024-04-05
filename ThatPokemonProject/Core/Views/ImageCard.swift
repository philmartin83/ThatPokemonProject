//
//  ImageCard.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//


import SwiftUI
import SDWebImageSwiftUI

struct ImageCard: View {
    
    let url: URL?
    let colour: Color
    
    var body: some View {
        WebImage(url: url)
            .indicator(.activity)
            .frame(width: 120, height: 180)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .fill(colour.gradient.opacity(0.2))
                    .stroke(.gray.opacity(0.4), lineWidth: 1)
            )
    }
}

#Preview {
    ImageCard(url: URL(string:"https://dummyimage.com/96")!, colour: .blue)
}

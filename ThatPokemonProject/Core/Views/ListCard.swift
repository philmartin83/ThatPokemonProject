//
//  ListCard.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListCard: View {
    
    // MARK: - Properties
    let url: URL?
    let title: String
    
    // MARK: - View
    var body: some View {
        HStack(spacing: 16) {
            WebImage(url: url)
            .indicator(.activity)
            .aspectRatio(contentMode: .fit)
            .frame(width: 90, height: 90)
            Text(title.capitalized)
                .font(.headline)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    ListCard(url: URL(string:"https://dummyimage.com/96")!, title: "Hello World")
}

//
//  DetailHeader.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailHeader: View {
    
    // MARK: - Properties
    let url: URL?
    let name: String
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            WebImage(url: url)
            .indicator(.activity)
            .frame(width: 120, height: 120)
            .overlay(
                    Circle()
                        .stroke(.gray.opacity(0.4), lineWidth: 1)
                )
            Text(name.capitalized)
                .font(.title)
                .fontWeight(.bold)
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h3)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    DetailHeader(url: URL(string:"https://dummyimage.com/96")!, name: "Hello World")
}

//
//  InfoCard.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct InfoCard<Content: View>: View {
    
    var cardColour: Color
    @ViewBuilder let content: () -> Content
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading) {
            content()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(cardColour)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    InfoCard(cardColour: .red, content: {
        Text("This is a piece of content")
    })
}


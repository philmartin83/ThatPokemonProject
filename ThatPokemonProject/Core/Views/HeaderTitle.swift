//
//  HeaderTitle.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct HeaderTitle: View {
    
    let headerTitle: String
    
    var body: some View {
        Text(headerTitle)
            .font(.title2)
            .fontWeight(.heavy)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
            .accessibilityAddTraits(.isHeader)
            .accessibilityHeading(.h4)
    }
}

#Preview {
    HeaderTitle(headerTitle: "Header")
}

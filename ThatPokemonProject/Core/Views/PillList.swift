//
//  PillList.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct PillList: View {
    
    // MARK: - Properties
    let title: String
    var listOfItems: [String]
    let randomColor: Color
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title3)
                .foregroundStyle(.white)
                .fontWeight(.bold)
                .accessibilityAddTraits(.isHeader)
                .accessibilityHeading(.h5)
            VStack(alignment: .leading) {
                WStack(listOfItems, spacing: 4, lineSpacing: 4, content: {move in
                    TagView(title: move, colour: randomColor)
                })
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

#Preview {
    PillList(title: "Moves", listOfItems: [], randomColor: .red)
}


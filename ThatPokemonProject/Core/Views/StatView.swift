//
//  StatView.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct StatView: View {
    
    // MARK: - Properties
    var stats: [PokemonStatViewModel]
    
    // MARK: - View
    var body: some View {
        HStack {
            Divider()
            VStack {
                ForEach(stats) { data in
                    ProgressView(data.statNameAndValue, value: Float(data.statValue), total: Float(IntConstants.baseStatMax))
                        .font(.caption)
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(data.statNameAndValue)
                }
            }
        }
    }
}

#Preview {
    StatView(stats: [PokemonStatViewModel(statName: "Some TestState", statValue: 100)])
}

//
//  PokemonStatViewModel.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

struct PokemonStatViewModel {
    // MARK: - Properties
    var statName: String
    var statValue: Int
    
    // MARK: - Computed Prooerties
    var statNameAndValue: String {
        let statsNameCleanUp = statName.replacingOccurrences(of: "-", with: " ")
        return "\(statsNameCleanUp.capitalized) \(statValue)"
    }
}

extension PokemonStatViewModel: Identifiable {
    var id: UUID {
        UUID()
    }
}

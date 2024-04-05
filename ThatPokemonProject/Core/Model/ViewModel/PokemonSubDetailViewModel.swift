//
//  PokemonSubDetailViewModel.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

struct PokemonSubDetailViewModel: Hashable {
    let title: String
    let body: String
    let icon: String
}

extension PokemonSubDetailViewModel: Identifiable {
    var id: UUID {
        UUID()
    }
}

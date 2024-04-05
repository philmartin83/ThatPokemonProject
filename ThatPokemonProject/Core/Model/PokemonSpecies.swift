//
//  PokemonSpecies.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

struct PokemonSpecies: Codable {
    let habitat: PokemonItem?
    let shape: PokemonItem
    let flavorTextEntries: [FlavorTextEntry]

    enum CodingKeys: String, CodingKey {
        case habitat
        case shape
        case flavorTextEntries = "flavor_text_entries"
    }
}

// MARK: - FlavorTextEntry
struct FlavorTextEntry: Codable {
    let flavorText: String
    let language, version: PokemonItem

    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language, version
    }

}

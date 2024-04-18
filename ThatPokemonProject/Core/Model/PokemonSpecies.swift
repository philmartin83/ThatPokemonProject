//
//  PokemonSpecies.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

// MARK: - PokemonSpecies
struct PokemonSpecies: Codable {
    let habitat: PokemonItem?
    let shape: PokemonItem
    let flavorTextEntries: [FlavorTextEntry]
}

// MARK: - FlavorTextEntry
struct FlavorTextEntry: Codable {
    let flavorText: String
    let language, version: PokemonItem
}

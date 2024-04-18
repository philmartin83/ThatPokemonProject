//
//  PokemonDetails.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

// MARK: - PokemonDetails
struct PokemonDetails: Codable {
    let abilities: [Ability]
    let height: Int
    let id: Int
    let moves: [Move]
    let species: PokemonItem
    let sprites: Sprites
    let stats: [Stat]
    let weight: Int
    
    var speciesId: Int {
        species.url.extractIDFromURL
    }
}

// MARK: - Ability
struct Ability: Codable {
    let ability: PokemonItem
}

// MARK: - Move
struct Move: Codable {
    let move: PokemonItem
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int
    let stat: PokemonItem
}

// MARK: - Sprites
class Sprites: Codable {
    let backDefault: String?
    let backShiny: String?
    let frontDefault: String?
    let frontShiny: String?
    let animated: Sprites?
    
    var urlStrings: [String?] {
        [frontDefault, backDefault, frontShiny, backShiny]
    }
}

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

    enum CodingKeys: String, CodingKey {
        case abilities
        case height
        case id
        case moves
        case sprites
        case weight
        case species
        case stats
    }
    
    var speciesId: Int {
        species.url.extractIDFromURL
    }
}

// MARK: - Ability
struct Ability: Codable {
    let ability: PokemonItem

    enum CodingKeys: String, CodingKey {
        case ability
    }
}

// MARK: - Move
struct Move: Codable {
    let move: PokemonItem

    enum CodingKeys: String, CodingKey {
        case move
    }
}

// MARK: - Stat
struct Stat: Codable {
    let baseStat, effort: Int
    let stat: PokemonItem

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
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

//
//  PokemonResult.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

// MARK: - PokemonResult
struct PokemonResult: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonItem]
}

// MARK: - PokemonItem
struct PokemonItem: Codable {
    let name: String
    let url: String
}


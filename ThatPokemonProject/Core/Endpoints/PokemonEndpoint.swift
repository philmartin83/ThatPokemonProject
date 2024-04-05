//
//  PokemonEndpoint.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

protocol PokemonServiceable {
    func fetchListOfPokemon(offset: Int) async throws -> PokemonResult
    func fetchPokemonDetails(id: Int) async throws -> PokemonDetails
    func fetchPokemonSpeciesInfo(id: Int) async throws -> PokemonSpecies
}

enum PokemonEndpoint {
    case pokemonList(offset: Int)
    case pokemonDetail(id: Int)
    case pokemonSpicies(id: Int)
}

extension PokemonEndpoint: Endpoint {
    var method: RequestMethod {
        switch self {
        case .pokemonList, .pokemonDetail, .pokemonSpicies:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .pokemonList, .pokemonDetail, .pokemonSpicies:
            return nil
        }
    }
    
    var body: Data? {
        switch self {
        case .pokemonList, .pokemonDetail, .pokemonSpicies:
            return nil
        }
    }
    
    var path: String {
        switch self {
        case .pokemonList(let offset):
            return "pokemon?limit=\(IntConstants.pokemonServiceLimit)&offset=\(offset)"
        case .pokemonDetail(let id):
            return "pokemon/\(id)"
        case .pokemonSpicies(id: let id):
            return "pokemon-species/\(id)"
        }
    }
}

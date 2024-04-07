//
//  PokemonService.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

class PokemonService: HTTPClient, PokemonServiceable {
    
    /**
     - Parameters:
      -  id: the id of selected pokemon to fetch the additional details
     */
    func fetchPokemonDetails(id: Int) async throws -> PokemonDetails {
        return try await sendRequest(endpoint: PokemonEndpoint.pokemonDetail(id: id), responseModel: PokemonDetails.self)
    }
    
    /**
     - Parameters:
      -  id: the id of selected pokemon to fetch the additional details
     */
    func fetchPokemonSpeciesInfo(id: Int) async throws -> PokemonSpecies {
        return try await sendRequest(endpoint: PokemonEndpoint.pokemonSpicies(id: id), responseModel: PokemonSpecies.self)
    }
    
    
    /**
     - Parameters:
      -  offset:  not used in this app but noticed you can paginate, with more time I'd explore pagination and use offset.
     */
    func fetchListOfPokemon(offset: Int) async throws -> PokemonResult {
        return try await sendRequest(endpoint: PokemonEndpoint.pokemonList(offset: offset), responseModel: PokemonResult.self)
    }
    
}

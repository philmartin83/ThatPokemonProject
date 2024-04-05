//
//  PokemonService.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

class PokemonService: HTTPClient, PokemonServiceable {
    
    /// `Parameter: id` the id of the select pokemon to fetch the additional details
    func fetchPokemonDetails(id: Int) async throws -> PokemonDetails {
        return try await sendRequest(endpoint: PokemonEndpoint.pokemonDetail(id: id), responseModel: PokemonDetails.self)
    }
    
    /// `Parameter: id` the id of the select pokemon to fetch the species details
    func fetchPokemonSpeciesInfo(id: Int) async throws -> PokemonSpecies {
        return try await sendRequest(endpoint: PokemonEndpoint.pokemonSpicies(id: id), responseModel: PokemonSpecies.self)
    }
    
    
    /// `Parameter: offset` not used in this app but noticed you can paginate, given more time that
    ///  I would of liked to explore that
    func fetchListOfPokemon(offset: Int) async throws -> PokemonResult {
        return try await sendRequest(endpoint: PokemonEndpoint.pokemonList(offset: offset), responseModel: PokemonResult.self)
    }
    
}

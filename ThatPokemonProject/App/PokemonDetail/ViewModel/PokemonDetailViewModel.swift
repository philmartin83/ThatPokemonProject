//
//  PokemonDetailViewModel.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

@Observable class PokemonDetailViewModel {
    
    // MARK: - Private Properties
    private let service: PokemonService!
    
    // MARK: - Properties
    var pokemon: PokemonViewModel!
    
    var state: ViewState = .defaultState

    // MARK: - Initaliser
    init(service: PokemonService, pokemon: PokemonViewModel) {
        self.service = service
        self.pokemon = pokemon
    }
    
    // MARK: - View State
    enum ViewState {
        case defaultState
        case loading
        case error
    }
    
    // MARK: - Helpers
    func fetchPokemonDetail() {
        state = .loading
        Task {
            do {
                let pokemonDetailData = try await service.fetchPokemonDetails(id: pokemon.id)
                let pokemonSpeicesData = try await service.fetchPokemonSpeciesInfo(id: pokemonDetailData.speciesId)
                pokemon.packPokemonDetails(detail: pokemonDetailData, species: pokemonSpeicesData)
                state = .defaultState
            } catch {
                state = .error
            }
        }
    }
}

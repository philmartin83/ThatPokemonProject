//
//  PokemonListViewModel.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

@Observable class PokemonListViewModel {
    
    // MARK: - Private Properties
    private let service: PokemonService!
    
    // MARK: - Properties
    var state: ViewState = .defaultState
    var pokemon: [PokemonViewModel] = []
    var pagingFetch = false
    var pageNumber: Int = 0
    var search = ""
    
    
    /// Computed property to handle the filtering of the list in the view
    var filterdResults: [PokemonViewModel] {
        if search.isEmpty {
            return pokemon
        }
        return pokemon.filter({$0.name.lowercased().contains(search.lowercased())})
    }
    
    // MARK: - View State
    enum ViewState {
        case defaultState
        case loading
        case error
    }
    
    init(service: PokemonService) {
        self.service = service
    }
    
    // MARK: - Helpers
    
    /// `page` is in place here incase in the future pagination would be required
    func fetchPokemon(page: Int = 0) {
        state = .loading
        Task {
            do {
                let result = try await service.fetchListOfPokemon(offset: 0)
                packPokemon(result: result)
                state = .defaultState
            } catch {
                state = .error
            }
        }
    }
    
    // MARK: - Private Helpers
    private func packPokemon(result: PokemonResult) {
        var arrayOfPokemonViewModel = [PokemonViewModel]()
        result.pokemon.forEach { pMon in
            arrayOfPokemonViewModel.append(PokemonViewModel(url: pMon.url,
                                                            name: pMon.name))
        }
        pokemon.append(contentsOf: arrayOfPokemonViewModel)
    }
}
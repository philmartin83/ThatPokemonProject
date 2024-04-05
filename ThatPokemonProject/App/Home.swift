//
//  Home.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct Home: View {
    @State private var selectedPokemon: PokemonViewModel?
    @State private var columnVisibility =
    NavigationSplitViewVisibility.doubleColumn
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
           PokemonList(selection: $selectedPokemon)
        } detail: {
            if let selectedPokemon {
                PokemonDetail(pokemonViewModel: selectedPokemon)
                    .tint(.primary)
                    .id(selectedPokemon.id)
            }
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    Home()
}

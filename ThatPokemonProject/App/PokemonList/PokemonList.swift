//
//  PokemonList.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct PokemonList: View {
    
    @State private var viewModel = PokemonListViewModel(service: PokemonService())
    
    @Binding var selection: PokemonViewModel?
    
    var body: some View {
        NavigationStack {
            ZStack {
                List(selection: $selection) {
                    ForEach(viewModel.filterdResults) { data in
                        NavigationLink(value: data) {
                            ListCard(url: data.iconURL, title: data.name)
                                .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .searchable(text: $viewModel.search)
                .listStyle(.plain)
                .onFirstAppear {
                    viewModel.fetchPokemon()
                }
                if viewModel.state == .loading {
                    ProgressView() // Activity Indicator
                        .tint(.primary)
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(2) // Adjust scale as needed
                }
            }
            .navigationDestination(for: PokemonViewModel.self, destination: { model in
                PokemonDetail(pokemonViewModel: model)
            })
            .navigationTitle("Menu")
        }
    }
}

#Preview {
    PokemonList(selection: .constant(nil))
}


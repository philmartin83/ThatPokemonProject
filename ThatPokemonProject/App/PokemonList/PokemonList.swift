//
//  PokemonList.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct PokemonList: View {
    
    @State private var viewModel = PokemonListViewModel(service: PokemonService())
    @State private var showError = false
    
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
                .refreshable {
                    viewModel.fetchPokemon()
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
            .onChange(of: viewModel.state, { _, newValue in
                if newValue == .error {
                    showError = true
                }
            })
            .alert("Error", isPresented: $showError, actions: {
                Button(role: .cancel) { } label: {
                    Text("OK")
                }

            }, message: {
                Text("Unable to fetch Pokemon's, please try later")
            })
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

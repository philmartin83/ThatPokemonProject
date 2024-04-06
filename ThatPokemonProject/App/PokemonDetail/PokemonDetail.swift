//
//  PokemonDetail.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import SwiftUI

struct PokemonDetail: View {
    
    // MARK: - Environment Object
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Properties
    private let pokemonViewModel: PokemonViewModel
    private let colours: [Color] = [Color.red, Color.blue, Color.purple, Color.pink, Color.green, Color.yellow]
    
    // MARK: - Computed Properties
    var randomColour: Color {
        colours.randomElement() ?? .red
    }
    
    // MARK: - State Properties
    @State private var viewModel: PokemonDetailViewModel!
    @State private var showError = false
    
    init(pokemonViewModel: PokemonViewModel) {
        self.pokemonViewModel = pokemonViewModel
        self._viewModel = State(wrappedValue: PokemonDetailViewModel(service: PokemonService(), pokemon: pokemonViewModel))
    }
    
    // MARK: - Body
    var body: some View {
        
        ScrollView {
            VStack {
                DetailHeader(url: viewModel.pokemon.iconURL, name: viewModel.pokemon.name)
                
                if viewModel.state == .loading {
                    SpinningProgress(scale: 1.2)
                } else if viewModel.state == .defaultState {
                    if viewModel.pokemon.hasHabitat {
                        SubDetail(title: "Habitat", bodyText: viewModel.pokemon.habitat.capitalized, icon: "house.fill", shouldAddDivider: false)
                            .padding(.vertical, 8)
                            .padding(.leading, -10)
                    }
                    SubHeaderDetail(content: {
                        ForEach(viewModel.pokemon.arrayOfPhyicalitiesDetails) { data in
                            SubDetail(title: data.title, bodyText: data.body, icon: data.icon)
                        }
                    })
                    .padding(.vertical)
                    
                    Text(viewModel.pokemon.flavourText)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.gray)
                        .font(.caption)
                        .padding(.bottom)
                    
                    Divider()
                    HorizontalScroll {
                        ForEach(viewModel.pokemon.pokemonImages) { imageURL in
                            ImageCard(url: imageURL, colour: .gray.opacity(0.7))
                        }
                    }
                    
                    HeaderTitle(headerTitle: "Stats")
                    
                    StatView(stats: viewModel.pokemon.stats)
                    
                    HeaderTitle(headerTitle: "Additional Information")
            
                    InfoCard(cardColour: randomColour, content: {
                        if viewModel.pokemon.hasAbilities {
                            PillList(title: "Abilities", listOfItems: viewModel.pokemon.abilities, randomColor: .blue)
                                .padding(.vertical)
                        }
                      
                        if viewModel.pokemon.hasShape {
                            Divider()
                            PillList(title: "Shape", listOfItems: [viewModel.pokemon.shape], randomColor: .gray)
                                .padding(.vertical)
                        }
                    })
                    
                }
            }
            .onChange(of: viewModel.state, { _, newValue in
                if newValue == .error {
                    showError = true
                }
            })
            .alert("Error", isPresented: $showError, actions: {
                Button("OK", role: .cancel) { }
            }, message: {
                Text("Unable to fetch \(viewModel.pokemon.name) information")
            })
            .padding(.horizontal)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Pokemon")
        }
        .onAppear {
            viewModel.fetchPokemonDetail()
        }
        
    }
}

#Preview {
    PokemonDetail(pokemonViewModel: PokemonViewModel(url:"https://dummyimage.com/96",
                                                     name: "Hello World"))
}

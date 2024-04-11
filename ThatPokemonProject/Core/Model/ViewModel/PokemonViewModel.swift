//
//  PokemonViewModel.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

class PokemonViewModel: Identifiable, Hashable, Equatable {
    
    // MARK: - Properties
    let url: String
    let name: String
    var details: PokemonDetails?
    var species: PokemonSpecies?
    
    // MARK: - Computed Properties
    var id: Int {
        url.extractIDFromURL
    }
    
    var iconURL: URL? {
        /*
         Not ideal to use this because the base url for resouses might
         change but the reasoning was the searching and filtering. 
         I found initalliy there doesn't seem to be an api that I can do
         real time searching using a contains on the search term only exact
         matches appear to work (Unless I've missed something). When
         requesting the list of pokemon upfront ("pokemon?limit") only the
         name and url is provided would be helpful to of had just the
         default icon.
        */
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
    }
    
    var arrayOfPhyicalitiesDetails: [PokemonSubDetailViewModel] {
        var array = [PokemonSubDetailViewModel]()
        let weight = PokemonSubDetailViewModel(title:"Weight", body: "\(weight)", icon: "scalemass.fill")
        let height = PokemonSubDetailViewModel(title:"Height", body: "\(height)", icon: "pencil.and.ruler.fill")
        let move = PokemonSubDetailViewModel(title:"Moves", body: "\(moves?.capitalized ?? "")", icon: "figure.dance")
        array.append(contentsOf: [weight, height, move])
        return array
    }
    
    var pokemonImages: [URL] {
        details?.sprites.urlStrings.compactMap { URL(string:$0 ?? "") } ?? []
    }
    
    var abilities: [String] {
        details?.abilities.map({$0.ability.name}) ?? []
    }
    
    var hasAbilities: Bool {
        abilities.count > 0
    }
    
    var stats: [PokemonStatViewModel] {
        details?.stats.map({PokemonStatViewModel(statName: $0.stat.name, statValue: $0.baseStat)}) ?? []
    }
    
    var moves: String? {
        var moves = [String]()
        moves = details?.moves.map({$0.move.name}) ?? []
        return moves.randomElement()
    }
    
    var habitat: String {
        species?.habitat?.name ?? ""
    }
    
    var hasHabitat: Bool {
        species?.habitat?.name != nil
    }
    
    var height: String {
        let lengthInCentimeters = details?.height ?? 0
        let lengthInMeters = Double(lengthInCentimeters) / 10.0 // Convert decimetres to meters

        return String(format: "%.1fm", lengthInMeters)
    }
    
    var weight: String {
        let weightInGrams = details?.weight ?? 0
        let weightInKilograms = Double(weightInGrams) / 10.0 // Convert hectograms to kilogram
        return String(format: "%.1fkg", weightInKilograms)
    }
    
    var shape: String {
        species?.shape.name ?? ""
    }
    
    var hasShape: Bool {
        species?.shape.name != nil
    }
    
    var flavourText: String {
        // Here I'm only extracting the english language
        let englishText = species?.flavorTextEntries.first(where: {$0.language.name == "en"})?.flavorText
        let stringWithoutNewlines = englishText?.replacingOccurrences(of: "\n", with: " ")
        return stringWithoutNewlines ?? ""
    }

    // MARK: - Initaliser
    init(url: String, name: String) {
        self.url = url
        self.name = name
    }
    
    // MARK: - Equatable
    static func ==(lhs: PokemonViewModel, rhs: PokemonViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    // MARK: - Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // MARK: - Helpers
    
    /**
     - Parameters:
      -  detail:  pass in additional details to update the viewmodel
      - species: pass in additional species to update the viewmodel
     - Note:
       -  Allows the extraction of the pokemon ids from URLs
     */
    func packPokemonDetails(detail: PokemonDetails, species: PokemonSpecies) {
        self.details = detail
        self.species = species
    }

}

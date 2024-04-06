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
        let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")
        return url
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
        var images = [URL]()
        details?.sprites.urlStrings.forEach { urlString in
            if let urlString, let url = URL(string: urlString) {
                images.append(url)
            }
        }
        return images
    }
    
    var abilities: [String] {
        var abilities = [String]()
        details?.abilities.forEach { detail in
            abilities.append(detail.ability.name)
        }
        return abilities
    }
    
    var hasAbilities: Bool {
        abilities.count > 0
    }
    
    var stats: [PokemonStatViewModel] {
        var stats = [PokemonStatViewModel]()
        details?.stats.forEach({ stat in
            stats.append(PokemonStatViewModel(statName: stat.stat.name, statValue: stat.baseStat))
        })
        return stats
    }
    
    var moves: String? {
        var moves = [String]()
        details?.moves.forEach { item in
            moves.append(item.move.name)
        }
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
        let lengthInMeters = Double(lengthInCentimeters) / 10.0 // Convert centimeters to meters

        return String(format: "%.1fm", lengthInMeters)
    }
    
    var weight: String {
        let weightInGrams = details?.weight ?? 0
        let weightInKilograms = Double(weightInGrams) / 10.0 // Convert grams to kilogram
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
        return lhs.id == rhs.id
    }
    
    // MARK: - Hashable
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    // MARK: - Helpers
    
    /// `Parameter: details` pass in additional details to update the viewmodel
    /// `Note` Function to update this viewmodel after getting the details of the selected pokemon
    func packPokemonDetails(detail: PokemonDetails, species: PokemonSpecies) {
        self.details = detail
        self.species = species
    }

}

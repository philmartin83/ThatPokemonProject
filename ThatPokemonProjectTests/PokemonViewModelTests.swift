//
//  PokemonViewModelTests.swift
//  ThatPokemonProjectTests
//
//  Created by Phil Martin on 06/04/2024.
//

import XCTest
@testable import ThatPokemonProject

final class PokemonViewModelTests: XCTestCase {

    var vmMock: PokemonViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vmMock = PokemonViewModel(url: "https://pokeapi.co/api/v2/pokemon/132", name: "That Guy Phil")
        let mockDetail = Bundle.main.decode(PokemonDetails.self, from: "detailMock.json")
        let mockSpecies = Bundle.main.decode(PokemonSpecies.self, from: "speciesMock.json")
        vmMock.packPokemonDetails(detail: mockDetail, species: mockSpecies)
    }

    override func tearDownWithError() throws {
       vmMock = nil
    }
    
    func test_idHasAValue_isEqual() {
        XCTAssertEqual(vmMock.id, 132)
    }
    
    func test_URLHasValue_isEqual() {
        XCTAssertEqual(vmMock.iconURL?.absoluteString, "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png")
    }
   
    func test_MovesCount_isTrue() {
        // Assumption made is a pokemon will always have moves, the mocks provides have moves
        XCTAssertTrue(vmMock.moves?.count ?? 0 > 0)
    }
    
    func test_AbilitiesCount_isTrue() {
        // Assumption made is a pokemon will always have abilities, the mocks provides have abilities
        XCTAssertTrue(vmMock.abilities.count > 0)
    }

}

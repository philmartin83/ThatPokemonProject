//
//  URL+Extension.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

extension URL: Identifiable {
    public var id: UUID {
        UUID()
    }
}

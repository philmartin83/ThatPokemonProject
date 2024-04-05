//
//  String+Extension.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

extension String {
    var extractIDFromURL: Int {
        var arrayOfComponents = self.components(separatedBy: "/")
        arrayOfComponents = arrayOfComponents.filter({ $0 != ""})
        let id = arrayOfComponents.last
        guard let id, let intId = Int(id) else {return 0}
        return intId
    }
}

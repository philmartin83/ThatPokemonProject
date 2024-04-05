//
//  RequestError.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        case .unexpectedStatusCode:
            return "Something went wrong"
        default:
            return "Unknown error"
        }
    }
}

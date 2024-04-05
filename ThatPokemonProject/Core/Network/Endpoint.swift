//
//  Endpoint.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: Data? { get }
}

extension Endpoint {
    var baseURL: String {
        return "https://pokeapi.co/api/v2/"
    }
}

enum RequestMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}

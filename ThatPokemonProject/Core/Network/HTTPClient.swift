//
//  HTTPClient.swift
//  ThatPokemonProject
//
//  Created by Phil Martin on 05/04/2024.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async throws -> T
}

extension HTTPClient {
    
    var defaultHeaders: [String: String] {
        [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
    
    
    func sendRequest<T: Decodable>(
        endpoint: Endpoint,
        responseModel: T.Type
    ) async throws -> T {
        let url = URL(string: endpoint.baseURL + endpoint.path)!
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        defaultHeaders.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        endpoint.header?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        if let body = endpoint.body {
            request.httpBody = body
        }
        
        let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
        guard let response = response as? HTTPURLResponse else {
            throw RequestError.noResponse
        }

        // Mainly used for debug purposes
        if let ppData = data.prettyPrintedJSONString {
            print(ppData)
        }
        
        switch response.statusCode {
        case 200...299:
            do {
                let decodedResponse = try JSONDecoder().decode(responseModel, from: data)
                return decodedResponse
            } catch {
                throw RequestError.decode
            }
        case 401:
            throw RequestError.unauthorized
        default:
            throw RequestError.unexpectedStatusCode
        }
    }
}


//
//  NetworkService.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 26.04.2025.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData(from url: URL) async throws -> Data
}

struct NetworkService: NetworkServiceProtocol {
    
    func fetchData(from url: URL) async throws -> Data {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw NetworkError.invalidStatusCode
        }
        
        guard (200...299).contains(statusCode) else {
            throw NetworkError.invalidStatusCode
        }
        
        return data
    }
    
}

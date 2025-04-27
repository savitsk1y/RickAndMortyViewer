//
//  APIManager.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 27.04.2025.
//

import Foundation

protocol APIManagerProtocol {
    func fetchCharacters() async -> [CharacterModel]
}

struct APIManager {
    
    enum Endpoint: String {
        case characters = "character"
        case locations = "location"
        case episodes = "episode"
    }

    let networkService: NetworkServiceProtocol

    private let baseURL = "https://rickandmortyapi.com/api/"

    func fetchCharacters() async -> [CharacterModel] {
        let url = buildURL(for: .characters)
        
        do {
            let data = try await networkService.fetchData(from: url)
            let characterResponse = try JSONDecoder().decode(CharacterResponseModel.self, from: data)
            return characterResponse.results
        } catch {
            return []
        }
    }
    
    private func buildURL(for endpoint: Endpoint) -> URL {
        URL(string: "\(baseURL)\(endpoint.rawValue)")!
    }
    
}

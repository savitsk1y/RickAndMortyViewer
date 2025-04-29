//
//  APIManager.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 27.04.2025.
//

import Foundation

protocol ApiManagerProtocol {
    func fetchCharacters() async throws -> [CharacterModel]
    func fetchCharacter(id: Int) async throws -> CharacterModel
}

struct ApiManager: ApiManagerProtocol {
    
    private let baseURL = "https://rickandmortyapi.com/api/"

    enum Endpoint {
        case characters
        case character(id: Int)
        
        static func buildPath(for endpoint: Self) -> String {
            switch endpoint {
            case .characters:
                "character"
            case .character(let id):
                "character/\(id)"
            }
        }
    }

    private let networkService: NetworkServiceProtocol

    internal init(networkService: any NetworkServiceProtocol) {
        self.networkService = networkService
    }

    func fetchCharacters() async throws -> [CharacterModel] {
        let path = baseURL + Endpoint.buildPath(for: .characters)
        let url = URL(string: path)!
        
        let data = try await networkService.fetchData(from: url)
        let characterResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
        return characterResponse.results
    }

    func fetchCharacter(id: Int) async throws -> CharacterModel {
        let path = baseURL + Endpoint.buildPath(for: .character(id: id))
        let url = URL(string: path)!
        
        let data = try await networkService.fetchData(from: url)
        let character = try JSONDecoder().decode(CharacterModel.self, from: data)
        return character
    }
    
}

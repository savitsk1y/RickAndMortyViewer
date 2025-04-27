//
//  APIManager.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 27.04.2025.
//

import Foundation

protocol ApiManagerProtocol {
    func fetchCharacters() async -> [CharacterModel]
}

struct ApiManager: ApiManagerProtocol {
    
    private let baseURL = "https://rickandmortyapi.com/api/"

    enum Endpoint {
        case characters
        case character(id: Int)
        case locations
        case episodes
        
        static func buildPath(for endpoint: Self) -> String {
            switch endpoint {
            case .characters:
                "character"
            case .character(let id):
                "character/\(id)"
            case .locations:
                "location"
            case .episodes:
                "episode"
            }
        }
    }

    let networkService: NetworkServiceProtocol

    func fetchCharacters() async -> [CharacterModel] {
        let path = baseURL + Endpoint.buildPath(for: .characters)
        let url = URL(string: path)!
        
        do {
            let data = try await networkService.fetchData(from: url)
            let characterResponse = try JSONDecoder().decode(CharacterResponseModel.self, from: data)
            return characterResponse.results
        } catch {
            return []
        }
    }

    func fetchCharacter(id: Int) async -> CharacterModel? {
        let path = baseURL + Endpoint.buildPath(for: .character(id: id))
        let url = URL(string: path)!
        
        do {
            let data = try await networkService.fetchData(from: url)
            let character = try JSONDecoder().decode(CharacterModel.self, from: data)
            return character
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
    
}

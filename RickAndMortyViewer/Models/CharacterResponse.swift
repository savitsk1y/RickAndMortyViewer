//
//  CharacterResponse.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 27.04.2025.
//

struct CharacterResponse: Codable {
    let results: [CharacterModel]
}

struct CharacterModel: Codable {
    public let id: Int
    public let name: String
    public let status: String
    public let species: String
    public let gender: String
    public let origin: CharacterOriginModel
    public let image: String
}

struct CharacterOriginModel: Codable {
    public let name: String
    public let url: String
}

//
//  CharacterModel.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 27.04.2025.
//

struct CharacterResponseModel: Codable {
    let info: Info
    let results: [CharacterModel]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct CharacterModel: Codable {
    public let id: Int
    public let name: String
    public let status: String
    public let species: String
    public let type: String
    public let gender: String
    public let origin: CharacterOriginModel
    public let location: CharacterLocationModel
    public let image: String
    public let episode: [String]
    public let url: String
    public let created: String
}

struct CharacterOriginModel: Codable {
    public let name: String
    public let url: String
}

struct CharacterLocationModel: Codable {
    public let name: String
    public let url: String
}

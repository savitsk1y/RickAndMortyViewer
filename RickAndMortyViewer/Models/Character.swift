//
//  Character.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 28.04.2025.
//

struct Character {
    
    let id: Int
    let image: String
    let name: String
    let status: String
    let species: String
    let gender: String
    let origin: String

    internal init(id: Int, image: String, name: String, status: String, species: String, gender: String, origin: String) {
        self.id = id
        self.image = image
        self.name = name
        self.status = status
        self.species = species
        self.gender = gender
        self.origin = origin
    }
    
    init(with model: CharacterModel) {
        self.id = model.id
        self.image = model.image
        self.name = model.name
        self.status = model.status
        self.species = model.species
        self.gender = model.gender
        self.origin = model.origin.name
    }

}

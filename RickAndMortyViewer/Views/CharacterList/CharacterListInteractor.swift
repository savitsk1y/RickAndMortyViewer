//
//  CharacterListInteractor.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 28.04.2025.
//

import Foundation

protocol CharacterListInteractorProtocol {
    func fetchCharacters()
}

class CharacterListInteractor: CharacterListInteractorProtocol {
    let apiManager = ApiManager(networkService: NetworkService())
    var presenter: CharacterListPresenterProtocol?

    func fetchCharacters() {
        Task {
            do {
                let characterModels = try await apiManager.fetchCharacters()
                let characters = characterModels.map { Character(with: $0) }
                Character.saveToCoreData(characters)
                self.presenter?.present(characters: characters)
            } catch {
                self.loadFromCoreData()
            }
        }
    }

    private func loadFromCoreData() {
        let localCharacters = Character.loadFromCoreData()
        presenter?.present(characters: localCharacters)
    }

}

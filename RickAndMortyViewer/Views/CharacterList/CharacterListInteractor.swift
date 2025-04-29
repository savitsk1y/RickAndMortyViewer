//
//  CharacterListInteractor.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 28.04.2025.
//

protocol CharacterListInteractorProtocol {
    func fetchCharacters()
}

class CharacterListInteractor: CharacterListInteractorProtocol {
    var presenter: CharacterListPresenterProtocol?
    private let apiManager = ApiManager(networkService: NetworkService())

    func fetchCharacters() {
        Task {
            do {
                let characterModels = try await apiManager.fetchCharacters()
                let characters = characterModels.map { Character(with: $0) }
                CoreDataStack.store(characters: characters)
                self.presenter?.present(characters: characters)
            } catch {
                self.loadFromCoreData()
            }
        }
    }

    private func loadFromCoreData() {        
        let localCharacters = CoreDataStack.loadCharacters()
        presenter?.present(characters: localCharacters)
    }

}

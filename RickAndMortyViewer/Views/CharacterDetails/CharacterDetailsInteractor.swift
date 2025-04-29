//
//  CharacterDetailsInteractor.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 28.04.2025.
//

protocol CharacterDetailsInteractorProtocol {
    func fetchCharacter(id: Int)
}

class CharacterDetailsInteractor: CharacterDetailsInteractorProtocol {
    
    var presenter: CharacterDetailsPresenterProtocol?
    private let apiManager = ApiManager(networkService: NetworkService())
    
    func fetchCharacter(id: Int) {
        Task {
            do {
                let characterModel = try await apiManager.fetchCharacter(id: id)
                let character = Character(with: characterModel)
                self.presenter?.present(character: character)
            } catch {
                self.loadFromCoreData(id: id)
            }
        }
    }
    
    private func loadFromCoreData(id: Int) {
        guard let localCharacter = CoreDataStack.loadCharacter(id: id) else { return }
        presenter?.present(character: localCharacter)
    }

}

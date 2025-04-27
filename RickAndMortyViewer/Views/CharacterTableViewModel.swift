//
//  CharacterTableViewModel.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 27.04.2025.
//

class CharacterTableViewModel {
    
    private let apiManager: ApiManagerProtocol
    private(set) var characters: [CharacterModel] = []
    var dataDidLoad: (() -> Void)?
    var selectedCharacter: ((Int) -> Void)?
    
    init(apiManager: ApiManagerProtocol) {
        self.apiManager = apiManager
    }
    
    func loadData() {
        Task {
            characters = await apiManager.fetchCharacters()
            dataDidLoad?()
        }
    }
    
}

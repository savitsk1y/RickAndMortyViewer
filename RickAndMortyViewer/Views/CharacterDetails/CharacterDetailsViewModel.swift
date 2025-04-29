//
//  CharacterDetailsViewModel.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 28.04.2025.
//

import UIKit

class CharacterDetailsViewModel {
    private let apiManager: ApiManagerProtocol
    private(set) var character: CharacterModel?
    private let characterId: Int
    
    var dataDidLoad: (() -> Void)?
    var selectedCharacter: ((Int) -> Void)?
    
    init(characterId: Int, apiManager: ApiManagerProtocol) {
        self.characterId = characterId
        self.apiManager = apiManager
    }
    
    func loadData() {
//        Task {
//            character = await apiManager.fetchCharacter(id: characterId)            
//        }
    }
}

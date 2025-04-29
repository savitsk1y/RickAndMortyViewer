//
//  CharacterDetailsPresenter.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 29.04.2025.
//

import Foundation

protocol CharacterDetailsPresenterProtocol {
    func present(character: Character)
}

class CharacterDetailsPresenter: CharacterDetailsPresenterProtocol {
    weak var viewController: CharacterDetailsControllerProtocol?

    func present(character: Character) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.display(character: character)
        }
    }
}

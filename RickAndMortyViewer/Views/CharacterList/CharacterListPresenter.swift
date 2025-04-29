//
//  CharacterListPresenter.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 28.04.2025.
//

import Foundation

protocol CharacterListPresenterProtocol {
    func present(characters: [Character])
}

class CharacterListPresenter: CharacterListPresenterProtocol {
    weak var viewController: CharacterListControllerProtocol?

    func present(characters: [Character]) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.display(characters: characters)
        }
    }
}

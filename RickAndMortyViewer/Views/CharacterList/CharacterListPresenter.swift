//
//  CharacterListPresenter.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 28.04.2025.
//

import UIKit

protocol CharacterListPresenterProtocol {
    func present(characters: [Character])
}

class CharacterListPresenter: CharacterListPresenterProtocol {
    weak var viewController: CharacterListControllerProtocol?

    func present(characters: [Character]) {
        viewController?.display(characters: characters)
    }
}

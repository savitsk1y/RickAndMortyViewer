//
//  CharacterListRouter.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 28.04.2025.
//

protocol CharacterListRouterProtocol {
    func routeToDetail(characterId: Int)
}

class CharacterListRouter: CharacterListRouterProtocol {
    weak var viewController: CharacterListController?

    func routeToDetail(characterId: Int) {
        let detailVC = CharacterDetailsController()
        detailVC.characterId = characterId
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}

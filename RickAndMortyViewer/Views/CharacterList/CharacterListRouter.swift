//
//  CharacterListRouter.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 28.04.2025.
//

protocol CharacterListRouterProtocol {
    func routeToDetail(characterID: Int)
}

class CharacterListRouter: CharacterListRouterProtocol {
    weak var viewController: CharacterListController?

    func routeToDetail(characterID: Int) {
        let detailVC = CharacterDetailsViewController()
        detailVC.characterID = characterID
        viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}

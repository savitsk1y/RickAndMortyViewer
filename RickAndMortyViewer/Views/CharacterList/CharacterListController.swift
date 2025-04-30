//
//  CharacterListController.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 27.04.2025.
//

import UIKit

protocol CharacterListControllerProtocol: AnyObject {
    func display(characters: [Character])
}

class CharacterListController: UITableViewController, CharacterListControllerProtocol {
    
    private var imageLoader = ImageLoader()
    private let cellIdentifier = "CharacterCell"
    private var characters: [Character] = []
    private var interactor: CharacterListInteractorProtocol?
    private var router: CharacterListRouterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        setup()
        interactor?.fetchCharacters()
    }
    
    private func setup() {
        tableView.register(CharacterCell.self, forCellReuseIdentifier: cellIdentifier)

        let interactor = CharacterListInteractor()
        let presenter = CharacterListPresenter()
        let router = CharacterListRouter()

        self.interactor = interactor
        self.router = router
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
    }
    
    func display(characters: [Character]) {
        self.characters = characters
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIDevice.current.userInterfaceIdiom == .pad ? 208 : 104
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as? CharacterCell else { return UITableViewCell() }
        
        let characterModel = characters[indexPath.row]
        cell.label.text = characterModel.name
        let fontSize = UIDevice.current.userInterfaceIdiom == .pad ? 36.0 : 20.0
        cell.label.font = .systemFont(ofSize: fontSize, weight: .regular)
        
        imageLoader.obtainImageWithPath(imagePath: characterModel.image) { image in
            guard let cell = tableView.cellForRow(at: indexPath) as? CharacterCell else { return }
            cell.iconImage.image = image
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        router?.routeToDetail(characterId: character.id)
    }
    
}

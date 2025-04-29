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
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)

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
        DispatchQueue.main.async {
            self.characters = characters
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as? CharacterCell else { return UITableViewCell() }
        
        let characterModel = characters[indexPath.row]
        cell.titleLabel.text = characterModel.name
        
        imageLoader.obtainImageWithPath(imagePath: characterModel.image) { (image) in
            guard let cell = tableView.cellForRow(at: indexPath) as? CharacterCell else { return }
            cell.iconImage.image = image
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        router?.routeToDetail(characterID: character.id)
    }
    
}

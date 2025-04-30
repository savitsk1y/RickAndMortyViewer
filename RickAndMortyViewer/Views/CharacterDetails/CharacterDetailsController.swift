//
//  CharacterDetailsController.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 27.04.2025.
//

import UIKit

protocol CharacterDetailsControllerProtocol: AnyObject {
    func display(character: Character)
}

class CharacterDetailsController: UIViewController, CharacterDetailsControllerProtocol {
   
    let imageView = UIImageView()
    let labelGender = UILabel()
    let labelOrigin = UILabel()
    let labelSpecies = UILabel()
    let labelStatus = UILabel()
    
    internal let scrollView = UIScrollView()
    internal let contentView = UIView()
    internal let labelsView = UIView()

    private var imageLoader = ImageLoader()
    private var character: Character?
    private var interactor: CharacterDetailsInteractorProtocol?
    var characterId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setup()
        guard let characterId else { return }
        interactor?.fetchCharacter(id: characterId)
    }
    
    private func setup() {
        let interactor = CharacterDetailsInteractor()
        let presenter = CharacterDetailsPresenter()

        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }
        
    func display(character: Character) {
        title = character.name
        labelGender.text = character.gender
        labelOrigin.text = character.origin
        labelSpecies.text = character.species
        labelStatus.text = character.status
        
        let fontSize = UIDevice.current.userInterfaceIdiom == .pad ? 24.0 : 20.0
        let font = UIFont.systemFont(ofSize: fontSize, weight: .regular)
        [labelGender, labelOrigin, labelSpecies, labelStatus].forEach {
            $0.font = font
        }
        
        imageLoader.obtainImageWithPath(imagePath: character.image) { [weak self] image in
            self?.imageView.image = image
        }
        view.layoutIfNeeded()
    }

}

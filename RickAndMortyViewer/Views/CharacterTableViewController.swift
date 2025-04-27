//
//  CharacterTableViewController.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 27.04.2025.
//

import UIKit

class CharacterTableViewController: UITableViewController {
    
    let viewModel: CharacterTableViewModel
    
    private let cellIdentifier = "CharacterCell"
    
    init(viewModel: CharacterTableViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
        
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        
        self.viewModel.dataDidLoad = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        title = "Characters List"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as? CharacterCell else {
            return UITableViewCell()
        }
        let characterModel = viewModel.characters[indexPath.row]
        cell.titleLabel.text = characterModel.name
        cell.iconImage.download(from: characterModel.image)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterModel = viewModel.characters[indexPath.row]
        viewModel.selectedCharacter?(characterModel.id)
    }
    
}

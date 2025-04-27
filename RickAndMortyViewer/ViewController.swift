//
//  ViewController.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 26.04.2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let networkService = NetworkService()
        let apiManager = APIManager(networkService: networkService)
        
        Task {
            let characters = await apiManager.fetchCharacters()
            print("=== \(characters)")
        }
    }


}


//
//  CharacterDetailsViewController.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 27.04.2025.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
   
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelGender: UILabel!
    @IBOutlet weak var labelOrigin: UILabel!
    @IBOutlet weak var labelSpecies: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    
    var characterID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelGender.text = "Lorem Ipsum" + "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"

        labelOrigin.text = "Lorem Ipsum is"

        labelSpecies.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"

        labelStatus.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but"

        view.layoutIfNeeded()
    }
}

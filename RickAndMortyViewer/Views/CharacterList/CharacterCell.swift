//
//  CharacterCell.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 27.04.2025.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    let iconImage = UIImageView()    
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(iconImage)
        iconImage.backgroundColor = .systemGray5
        iconImage.image = .init(systemName: "photo.artframe")
        iconImage.contentMode = .scaleAspectFit
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
            iconImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            iconImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            iconImage.heightAnchor.constraint(equalTo: iconImage.widthAnchor)
        ])
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor),
            label.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -12)
        ])
    }
    
}

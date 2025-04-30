//
//  CharacterDetailsController+setupUI.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 30.04.2025.
//

import UIKit

extension CharacterDetailsController {
        
    internal func setupUI() {
        view.backgroundColor = .systemBackground        
        addContainer()
        addImage()
        addLabelsContainer()
        addLabelsGender()
        addLabelsOrigin()
        addLabelsSpecies()
        addLabelsStatus()
    }
    
    private func addContainer() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func addImage() {
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 280),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
        imageView.backgroundColor = .systemGray5
        imageView.contentMode = .scaleAspectFit
        imageView.image = .init(systemName: "photo.artframe")
    }
    
    private func addLabelsContainer() {
        contentView.addSubview(labelsView)
        labelsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            labelsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            labelsView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            labelsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    private func addLabelsGender() {
        let titleGender = createTitle(label: "Gender")
        titleGender.translatesAutoresizingMaskIntoConstraints = false
        labelsView.addSubview(titleGender)
        NSLayoutConstraint.activate([
            titleGender.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor, constant: 8)
        ])

        labelGender.translatesAutoresizingMaskIntoConstraints = false
        setupAsDetail(label: labelGender)
        labelsView.addSubview(labelGender)
        NSLayoutConstraint.activate([
            labelGender.topAnchor.constraint(equalTo: labelsView.topAnchor, constant: 8),
            labelGender.leadingAnchor.constraint(equalTo: titleGender.trailingAnchor, constant: 16),
            labelGender.trailingAnchor.constraint(equalTo: labelsView.trailingAnchor, constant: -8),
            labelGender.topAnchor.constraint(equalTo: titleGender.topAnchor)
        ])
    }
    
    private func addLabelsOrigin() {
        let titleOrigin = createTitle(label: "Origin")
        titleOrigin.translatesAutoresizingMaskIntoConstraints = false
        labelsView.addSubview(titleOrigin)
        NSLayoutConstraint.activate([
            titleOrigin.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor, constant: 8)
        ])

        labelOrigin.translatesAutoresizingMaskIntoConstraints = false
        setupAsDetail(label: labelOrigin)
        labelsView.addSubview(labelOrigin)
        NSLayoutConstraint.activate([
            labelOrigin.topAnchor.constraint(equalTo: labelGender.bottomAnchor, constant: 16),
            labelOrigin.leadingAnchor.constraint(equalTo: titleOrigin.trailingAnchor, constant: 16),
            labelOrigin.trailingAnchor.constraint(equalTo: labelsView.trailingAnchor, constant: -8),
            labelOrigin.topAnchor.constraint(equalTo: titleOrigin.topAnchor)
        ])
    }
    
    private func addLabelsSpecies() {
        let titleSpecies = createTitle(label: "Species")
        titleSpecies.translatesAutoresizingMaskIntoConstraints = false
        labelsView.addSubview(titleSpecies)
        NSLayoutConstraint.activate([
            titleSpecies.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor, constant: 8)
        ])

        labelSpecies.translatesAutoresizingMaskIntoConstraints = false
        setupAsDetail(label: labelSpecies)
        view.addSubview(labelSpecies)
        NSLayoutConstraint.activate([
            labelSpecies.topAnchor.constraint(equalTo: labelOrigin.bottomAnchor, constant: 16),
            labelSpecies.leadingAnchor.constraint(equalTo: titleSpecies.trailingAnchor, constant: 16),
            labelSpecies.trailingAnchor.constraint(equalTo: labelsView.trailingAnchor, constant: -8),
            labelSpecies.topAnchor.constraint(equalTo: titleSpecies.topAnchor)
        ])
    }
    
    private func addLabelsStatus() {
        let titleStatus = createTitle(label: "Status")
        titleStatus.translatesAutoresizingMaskIntoConstraints = false
        labelsView.addSubview(titleStatus)
        NSLayoutConstraint.activate([
            titleStatus.leadingAnchor.constraint(equalTo: labelsView.leadingAnchor, constant: 8)
        ])

        labelStatus.translatesAutoresizingMaskIntoConstraints = false
        setupAsDetail(label: labelStatus)
        view.addSubview(labelStatus)
        NSLayoutConstraint.activate([
            labelStatus.topAnchor.constraint(equalTo: labelSpecies.bottomAnchor, constant: 16),
            labelStatus.leadingAnchor.constraint(equalTo: titleStatus.trailingAnchor, constant: 16),
            labelStatus.trailingAnchor.constraint(equalTo: labelsView.trailingAnchor, constant: -8),
            labelStatus.topAnchor.constraint(equalTo: titleStatus.topAnchor),
            labelStatus.bottomAnchor.constraint(equalTo: labelsView.bottomAnchor, constant: -16)
        ])
    }
    
    private func createTitle(label text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemBlue
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }
    
    private func setupAsDetail(label: UILabel) {
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    
}

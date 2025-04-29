//
//  Character+CoreData.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 28.04.2025.
//

import CoreData

extension Character {

    static func saveToCoreData(_ characters: [Character]) {
        guard !characters.isEmpty else { return }
        
        let context = CoreDataStack.shared.context

        // Wipe records
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "CharacterEntity")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        _ = try? context.execute(deleteRequest)

        for character in characters {
            let entity = CharacterEntity(context: context)
            entity.id = Int32(character.id)
            entity.name = character.name
            entity.status = character.status
            entity.species = character.species
            entity.image = character.image
            entity.gender = character.gender
            entity.origin = character.origin
        }

        CoreDataStack.shared.saveContext()
    }

    static func loadFromCoreData() -> [Character] {
        let context = CoreDataStack.shared.context
        let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()

        guard let result = try? context.fetch(request) else { return [] }

        return result.map {
            Character(id: Int($0.id),
                      image: $0.image ?? "",
                      name: $0.name ?? "",
                      status: $0.status ?? "",
                      species: $0.species ?? "",
                      gender: $0.gender ?? "",
                      origin: $0.origin ?? "")
        }
    }
}

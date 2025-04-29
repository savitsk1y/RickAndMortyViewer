//
//  CoreDataStack.swift
//  RickAndMortyViewer
//
//  Created by Andrii Savytskyi on 28.04.2025.
//

import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "RickAndMortyViewer")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("CoreData load error: \(error)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            try? context.save()
        }
    }
    
    // MARK: storing characters
    static func store(characters: [Character]) {
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

    static func loadCharacters() -> [Character] {
        let context = CoreDataStack.shared.context
        let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()

        guard let result = try? context.fetch(request) else { return [] }
        return result.map { character(from: $0) }
    }
    
    static func loadCharacter(id: Int) -> Character? {
        let context = CoreDataStack.shared.context
        let request: NSFetchRequest<CharacterEntity> = CharacterEntity.fetchRequest()
        let predicate = NSPredicate(format: "id == %i", id)
        request.predicate = predicate
        guard let result = try? context.fetch(request), let firstItem = result.first else {
            return nil
        }

        return character(from: firstItem)
    }

    static func character(from entity: CharacterEntity) -> Character {
        Character(id: Int(entity.id),
                  image: entity.image ?? "",
                  name: entity.name ?? "",
                  status: entity.status ?? "",
                  species: entity.species ?? "",
                  gender: entity.gender ?? "",
                  origin: entity.origin ?? "")
    }

}

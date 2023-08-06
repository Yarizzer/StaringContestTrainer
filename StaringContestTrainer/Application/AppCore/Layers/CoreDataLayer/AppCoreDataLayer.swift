//
//  AppCoreDataLayer.swift
//  StaringContestTrainer
//
//  Created by Yaroslav Abaturov on 6.08.2023.
//

import CoreData

class AppCoreDataLayer {
    init() {
        self.container = NSPersistentContainer(name: Constants.containerName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        self.context = container.viewContext
    }
    
    //MARK: - Context
    private func saveContext(completion: (Bool) -> ()) {
        do {
            try context.save()
            completion(true)
        } catch {
            writeLog(type: .coreDataError, message: error.localizedDescription)
            completion(false)
        }
    }
    
    private func fetchData() {
        let fetchRequest: NSFetchRequest<Training> = Training.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest)
            
            var list = [TrainingModel]()
            
            result.forEach { list.append(TrainingModel(with: $0)) }
            
            trainingList.value = list
        } catch {
            writeLog(type: .coreDataError, message: error.localizedDescription)
        }
    }
    
    //Publishers
    var trainingList: Publisher<[TrainingModel]?> = Publisher(nil)
    
    private let container: NSPersistentContainer
    private let context: NSManagedObjectContext
}

extension AppCoreDataLayer: AppCoreDataLayerType {
    //MARK: - Session
    func prepareSession() {
        fetchData()
    }
}

extension AppCoreDataLayer {
    private struct Constants {
        static let containerName = "StaringContestTrainer"
    }
}

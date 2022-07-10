//
//  CoreDataManager.swift
//  WeightliftingLog
//
//  Created by miori Lee on 2022/07/10.
//

import Foundation
import CoreData
import SwiftUI

class CoreDataManager: ObservableObject {
    //싱글톤
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "WeightliftingLog")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    func saveContext() {
        if mainContext.hasChanges {
            do {
                try mainContext.save()
            } catch {
                print(error)
            }
        }
    }
    //CRUD
    func addTrLog(trLog: String) {
        let newTrLog = WeightliftingLogEntity(context: mainContext)
        newTrLog.trainingLog = trLog
        newTrLog.insertDate = Date.now
        
        saveContext()
    }
    
    //업데이트
    func update(trLog: WeightliftingLogEntity?, newTrLog: String) {
        trLog?.trainingLog = newTrLog
        saveContext()
    }
    
    func delete(trLog: WeightliftingLogEntity?) {
        if let trLog = trLog {
            mainContext.delete(trLog)
            saveContext()
        }
    }
}

//
//  CoreDataViewModel.swift
//  InstaBug-Logging
//
//  Created by Mohamed Ali on 01/06/2021.
//

import Foundation
import CoreData

public class CoreDataViewModel {
    
    public init() { }

    public static let shared = CoreDataViewModel()
    
    let identifier: String  = "com.myorganization199.InstaBug-Logging"
    let model: String       = "LoggingModel"
    
    lazy var persistentContainer: NSPersistentContainer = {
        //5
        let messageKitBundle = Bundle(identifier: self.identifier)
        let modelURL = messageKitBundle!.url(forResource: self.model, withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
        
        let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel!)
                container.loadPersistentStores { (storeDescription, error) in
                    
            if let err = error{
                fatalError("❌ Loading of store failed:\(err)")
            }
        }
        
        return container
    }()
    
    public func createLogging(loggingDate: String, loggingMessage: String, loggingType: String ){
            
        let context = persistentContainer.viewContext
//        let entity = NSEntityDescription.insertNewObject(forEntityName: "LoggingModel", into: context)!
        let entity = NSEntityDescription.entity(forEntityName: "LoggingModel", in: context)!
        
        let logging = NSManagedObject(entity: entity,insertInto: context)
        
        logging.setValue(loggingDate , forKeyPath: "loggingDate")
        logging.setValue(loggingMessage , forKeyPath: "loggingMessage")
        logging.setValue(loggingType , forKeyPath: "loggingType")
        
        do {
            try context.save()
            print("✅ Logging saved succesfuly")
            
        } catch let error {
            print("❌ Failed to create Logging Message: \(error.localizedDescription)")
        }
    }
    
    public func fetch() -> [NSManagedObject]? {
            
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LoggingModel")
        
        do{
            
            let persons = try context.fetch(fetchRequest)
            return persons
            
//            for (index,person) in persons.enumerated() {
//                print("Person \(index): \(person.firstname ?? "N/A") \(person.lastname ?? "N/A") Age:\(person.age )")
//        }
            
        } catch let fetchErr {
            print("❌ Failed to fetch Logging:",fetchErr)
        }
        return nil
    }
    
    public func Delete(element: NSManagedObject) {
        
        let context = persistentContainer.viewContext
        
        context.delete(element)
        
        do {
            try context.save()
            print("Deleted Successfully!")
        } catch let error as NSError {
           print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    public func DeleteAllLogging() {
        
        let context = persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "LoggingModel")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try context.execute(deleteRequest)
            print("Deleted All Fields")
//            try myPersistentStoreCoordinator.execute(deleteRequest, with: myContext)
        } catch let error as NSError {
            // TODO: handle the error
            print("Could not delete. \(error), \(error.userInfo)")
        }
        
    }
    
}

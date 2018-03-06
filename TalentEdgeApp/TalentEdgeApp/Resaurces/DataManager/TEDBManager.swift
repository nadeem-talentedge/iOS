//
//  TEDBManager.swift
//  RenaultCare
//
//  Created by Vinod Sahu on 12/19/16.
//  Copyright © 2016 Renault. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class TEDBManager: NSObject {
    
    static let sharedInstance = TEDBManager()
    
    override init() {
        
        super.init()
    }
    
    private lazy var applicationDocumentsDirectory: URL = {
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return urls[urls.count-1]
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        
        let modelURL = Bundle.main.url(forResource: "TalentEdge", withExtension: "momd")!
        
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        let url = self.applicationDocumentsDirectory.appendingPathComponent("TalentEdge.sqlite")
        
        var failureReason = "There was an error creating or loading the application's saved data."
        
        do {
            
            let options = [ NSMigratePersistentStoresAutomaticallyOption : true, NSInferMappingModelAutomaticallyOption : true ]
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: options)
            
        } catch {
            
            
            var dict = [String: AnyObject]()
            
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject?
            
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject?
            
            dict[NSUnderlyingErrorKey] = error as NSError
            
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            
            abort()
        }
        
        return coordinator
    }()
    
    // iOS-10
    @available(iOS 10.0, *)
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "TalentEdge")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        print("\(self.applicationDocumentsDirectory)")
        return container
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        
        var managedObjectContext: NSManagedObjectContext?
        
        if #available(iOS 10.0, *){
            
            managedObjectContext = self.persistentContainer.viewContext
        }
        else{
            
            let coordinator = self.persistentStoreCoordinator
            
            managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
            
            managedObjectContext?.persistentStoreCoordinator = coordinator
            
        }
        return managedObjectContext!
    }()
    
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }
    
    //MARK:- Login user Detail
    
    /*
     @NSManaged public var event_detail_id: String?
     @NSManaged public var venue: String?
     @NSManaged public var id: String?
     @NSManaged public var content_type_id: String?
     @NSManaged public var title: String?
     @NSManaged public var start_date: String?
     @NSManaged public var : String?
     @NSManaged public var all_day_event: Bool
     @NSManaged public var end_date: String?
     @NSManaged public var description_value: String?
    */
    
    func saveEventDetailModel(dict:NSDictionary?) -> Void {
        
        
        if let dict = dict {
        
            print(dict,"\n")
            
            //print("OK --->",dict.value(forKey: "start_date") ?? "NA","<----->", dict.value(forKey: "end_date") ?? "NA")
            
            let manageObjectContext = self.managedObjectContext
            
            let dateFormat = DateFormatter()
            let dateFormat2 = DateFormatter()
            
            dateFormat.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormat2.dateFormat = "yyyy-MM-dd"
            
            if let eventId = dict.value(forKey: "id") as? String{
            
                
                
                if let entity = self.getEventEntityForId(eventId: eventId){
                
                    entity.event_detail_id = dict.value(forKey: "event_detail_id") as? String
                    entity.venue = dict.value(forKey: "venue") as? String
                    entity.id = dict.value(forKey: "id") as? String
                    entity.content_type_id = dict.value(forKey: "content_type_id") as? String
                    entity.title = dict.value(forKey: "title") as? String
                    
                    
                    if let start = dict.value(forKey: "start_date") as? String{
                    
                        if let startDate = dateFormat.date(from: start){
                        
                            entity.start_date_complete = startDate as NSDate
                            //print("Update Start Date --->",entity.start_date_complete ?? "")
                            
                            let compareDate = dateFormat2.string(from: startDate)
                            
                            if let startDate = dateFormat2.date(from:  compareDate ){
                                
                                entity.start_date = startDate as NSDate
                                //print("Update Start Compare --->",entity.start_date ?? "")
                            }
                        }
                        
                    }else{
                    
                        print("NIl Start")
                        entity.start_date = nil
                    }
                    
                    
                    if let end = dict.value(forKey: "end_date") as? String{
                        
                        if let endDate = dateFormat.date(from: end){
                            
                            entity.end_date_complete = endDate as NSDate
                            //print("Update End Date --->",entity.end_date_complete ?? "")
                            
                            let compareDate = dateFormat2.string(from: endDate)
                            
                            if let endDate = dateFormat2.date(from:  compareDate ){
                                
                                entity.end_date = endDate as NSDate
                                //print("Update End Compare --->",entity.end_date ?? "")
                            }
                        }
                        
                    }else{
                        
                        print("NIl Start")
                        entity.end_date = nil
                    }
                    
                    
                    
                    entity.color_code = dict.value(forKey: "color_code") as? String
                    entity.title = dict.value(forKey: "title") as? String
                    entity.all_day_event = (dict.value(forKey: "all_day_event") as? Bool) ?? false
                    
                    entity.description_value = dict.value(forKey: "description") as? String
                    
                    do {
                        
                        try manageObjectContext.save()
                        //print(" Update ")
                        
                        
                    } catch let error as NSError  {
                        
                        print("Could not save Login User Detail \(error), \(error.userInfo)")
                    }
                    
                }else{
                
                    if let entity = NSEntityDescription.entity(forEntityName: EventEntity.entityName, in:
                        manageObjectContext){
                        
                        let entity = EventEntity(entity: entity, insertInto: manageObjectContext)
                        
                        entity.event_detail_id = dict.value(forKey: "event_detail_id") as? String
                        entity.venue = dict.value(forKey: "venue") as? String
                        entity.id = dict.value(forKey: "id") as? String
                        entity.content_type_id = dict.value(forKey: "content_type_id") as? String
                        entity.title = dict.value(forKey: "title") as? String
                        
                        if let start = dict.value(forKey: "start_date") as? String{
                            
                            if let startDate = dateFormat.date(from: start){
                                
                                entity.start_date_complete = startDate as NSDate
                                print("Update Start Date --->",entity.start_date_complete ?? "")
                                
                                let compareDate = dateFormat2.string(from: startDate)
                                
                                if let startDate = dateFormat2.date(from:  compareDate ){
                                    
                                    entity.start_date = startDate as NSDate
                                    //print("Update Start Compare --->",entity.start_date ?? "")
                                }
                            }
                            
                        }else{
                            
                            print("NIl Start")
                            entity.start_date = nil
                        }
                        
                        
                        if let end = dict.value(forKey: "end_date") as? String{
                            
                            if let endDate = dateFormat.date(from: end){
                                
                                entity.end_date_complete = endDate as NSDate
                                //print("Update End Date --->",entity.end_date_complete ?? "")
                                
                                let compareDate = dateFormat2.string(from: endDate)
                                
                                if let endDate = dateFormat2.date(from:  compareDate ){
                                    
                                    entity.end_date = endDate as NSDate
                                    //print("Update End Compare --->",entity.end_date ?? "")
                                }
                            }
                            
                        }else{
                            
                            print("NIl Start")
                            entity.end_date = nil
                        }
                        
                        entity.color_code = dict.value(forKey: "color_code") as? String
                        
                        entity.title = dict.value(forKey: "title") as? String
                        
                        entity.all_day_event = (dict.value(forKey: "all_day_event") as? Bool) ?? false
                        
                        entity.description_value = dict.value(forKey: "description") as? String
                        
                        do {
                            
                            try manageObjectContext.save()
                            //print(" Saved ")
                            
                            
                        } catch let error as NSError  {
                            
                            print("Could not save Login User Detail \(error), \(error.userInfo)")
                        }
                        
                        
                    }
                }
                
            }
        }
        
    }
    
    func getEventEntityForId(eventId:String?) -> EventEntity? {
        
        if let eventId = eventId {
        
            let manageObjectContext = self.managedObjectContext
            
            do {
                
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: EventEntity.entityName)
                
                let predicate = NSPredicate(format: "id==%@", eventId)
                
                fetchRequest.predicate = predicate
                
                let result = try manageObjectContext.fetch(fetchRequest) as? [EventEntity]
                
                if (result?.count)! > 0{
                    
                    //return nil
                    return result?[0]
                }
                
            }catch let error as NSError  {
                
                print("Could not get Event Detail : \(error), \(error.userInfo)")
            }
        }
        return nil
    }
    
    
    func getEventEntityForDate(eventStartDate:NSDate?) -> [EventEntity]? {
        
        if let eventStartDate = eventStartDate {
            
            
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            
            let formatDate = dateFormat.string(from: eventStartDate as Date)
            
            if let formatDateString = dateFormat.date(from: formatDate){
                
                let manageObjectContext = self.managedObjectContext
                
                do {
                    
                    //print("Request Start Date ------------------> ",formatDateString)
                    
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: EventEntity.entityName)
                    
                    let predicate = NSPredicate(format: "start_date == %@", formatDateString as NSDate)
                    
                    fetchRequest.predicate = predicate
                    
                     return try manageObjectContext.fetch(fetchRequest) as? [EventEntity]
                     //return nil
                    
                }catch let error as NSError  {
                    
                    print("Could not get Event Detail : \(error), \(error.userInfo)")
                }
            }
            
            
            
        }
        return nil
    }
}

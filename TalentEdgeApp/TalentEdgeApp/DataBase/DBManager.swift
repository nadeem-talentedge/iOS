//
//  DBManager.swift
//  TalentEdgeApp
//
//  Created by Vinod Kumar Sahu on 16/12/17.
//  Copyright © 2017 Vinod Sahu. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
import Foundation

class DBManager: NSObject {
    
    let fileName = "announcement.json"
    static let sharedInstance = DBManager()
    
    
    override init() {
        
        super.init()
    }
    
    private lazy var applicationDocumentsDirectory: URL = {
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return urls[urls.count-1]
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        
        let modelURL = Bundle.main.url(forResource: "TalentEdgeModel", withExtension: "momd")!
        
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        let url = self.applicationDocumentsDirectory.appendingPathComponent("TalentEdgeModel.sqlite")
        
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
        
        let container = NSPersistentContainer(name: "TalentEdgeModel")
        
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
    
}

//MARK:- Announcment Data

extension DBManager {
    
    func getFilePath(fileName:String) -> String?{
        
        let fileManager = FileManager.default
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        var documentsDirectory = URL(fileURLWithPath: paths[0])
        
        documentsDirectory = documentsDirectory.appendingPathComponent(fileName)
        
        if fileManager.fileExists(atPath: documentsDirectory.relativePath) == false{
            
            return nil
        }
        return documentsDirectory.relativePath
    }
    
    func saveDataIntoFile(data:NSArray?) -> Void{
        
        if let data = data{
    
            let fileManager = FileManager.default
            
            if let filePath = self.getFilePath(fileName: self.fileName){
            
                do {
                    
                    print("delete directory")
                    try fileManager.removeItem(atPath: filePath)
                    
                } catch let error as NSError {
                    
                    NSLog("Unable to delete directory \(error.debugDescription)")
                }
            }
            
            let jsons = NSMutableArray(array: data)
            
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            
            let documentsDirectory = URL(fileURLWithPath: paths[0]).appendingPathComponent(self.fileName).relativePath
            
            let stream = OutputStream(toFileAtPath: documentsDirectory, append: false)
            
            stream?.open()
            
            JSONSerialization.writeJSONObject(jsons, to: stream!, options: .prettyPrinted, error: nil)
            
            stream?.close()
            
        }
    }
    
    func getSaveOfflineData() -> NSArray? {
        
        if let filePath = self.getFilePath(fileName: self.fileName){
            
            if let inputStream = InputStream(fileAtPath: filePath) {
            
                inputStream.open()
                
                do {
                
                    let coursesRead = try JSONSerialization.jsonObject(with: inputStream, options: .init(rawValue: 0)) as! NSArray
                    
                    inputStream.close()
                    
                    return coursesRead
                    
                }catch let error as NSError{
                    
                    NSLog("Unable Retrive data --------- \(error.debugDescription)")
                }
            }
        }
        return nil
        
    }
}

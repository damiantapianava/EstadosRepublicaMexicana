//
//  DBManager.swift
//  Practica1
//
//  Created by Infraestructura on 01/10/16.
//  Copyright © 2016 Infraestructura. All rights reserved.
//

import Foundation
import CoreData

class DBManager
{
    static let instance = DBManager()
    
    func getFugituves(nameEntity: String, _ ordenarPor: String) -> NSArray
    {
        let elQuery:NSFetchRequest = NSFetchRequest()
        
        let laEntidad: NSEntityDescription = NSEntityDescription.entityForName(nameEntity, inManagedObjectContext: self.managedContext!)!
        
        elQuery.entity = laEntidad
        
        do
        {
            let result = try self.managedContext!.executeFetchRequest(elQuery)
            
            return result as NSArray
            
        } catch {
            
            print ("Error al ejecutar request")
            
            return NSArray()
        }
    }
    
    
    
    lazy var managedContext:NSManagedObjectContext? =
    {
        let persistance = self.persistenceStore
        
        if persistance == nil
        {
            return nil
        }
        
        var moc = NSManagedObjectContext()
        
        moc.persistentStoreCoordinator = persistance
        
        return moc
    }()
    
    lazy var managedModel : NSManagedObjectModel? =
    {
        let modelURL = NSBundle.mainBundle().URLForResource("Practica1Model", withExtension: "momd")
        
        var model = NSManagedObjectModel(contentsOfURL : modelURL!)
        
        return model
    }()
    
    lazy var persistenceStore : NSPersistentStoreCoordinator? =
    {
        let modelo = self.managedModel
        
        if modelo == nil{return nil}
        
        let persist = NSPersistentStoreCoordinator(managedObjectModel: modelo!)
        
        //Encotranr la ubicacion de la BD
        
        let urlDeLaBD = self.directorioDocuments.URLByAppendingPathComponent("BountyHunter.sqlite")
        
        do
        {
            let opcionesDePersistencia = [NSMigratePersistentStoresAutomaticallyOption:true, NSInferMappingModelAutomaticallyOption: true]
            
            try persist.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL:urlDeLaBD, options: opcionesDePersistencia)
            
        } catch {
            
        }
        
        return persist
    }()
    
    lazy var directorioDocuments : NSURL =
    {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        
        return urls[urls.count - 1]
    }()
}
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
    
    static func getFugituves(nameEntity: String) -> NSArray
    {
        return NSArray()
    }
    
    lazy var context:NSManagedObjectContext? =
    {
        let persistance = self.store
        
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
        let modelURL = NSBundle.mainBundle().URLForResource("BountyHunter", withExtension: "momd")
        
        var model = NSManagedObjectModel(contentsOfURL : modelURL!)
        
        return model
    }()
    
    lazy var store : NSPersistentStoreCoordinator? =
    {
        let modelo = self.managedModel
        
        if modelo == nil{return nil}
        
        let persist = NSPersistentStoreCoordinator(managedObjectModel: modelo!)
        
        return persist
    }()
}
//
//  AppDelegate.swift
//  TodoApp
//
//  Created by Khoa Pham on 19/03/2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        fetchCoreData()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "TodoApp")
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
        return container
    }()

    // MARK: - Core Data Saving support
    
    func fetchCoreData() {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ItemToSellEntity")
        do {
            let items: [NSManagedObject] = try context.fetch(fetchRequest)
            
            if items.isEmpty {
                saveContext()
            } else {
                items.forEach {
                    print("Name: \($0.value(forKey: "name") ?? "")")
                    print("Price: \($0.value(forKey: "price") ?? 0)")
                    print("Quantity: \($0.value(forKey: "quantity") ?? 0)")
                }
            }

        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }

    func saveContext () {
        let context = persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "ItemToSellEntity", in: context)!
        
        let item1 = NSManagedObject(entity: entity, insertInto: context)
        item1.setValue(1, forKey: "id")
        item1.setValue("iPhone X", forKey: "name")
        item1.setValue(150000, forKey: "price")
        item1.setValue(1, forKey: "quantity")
        item1.setValue(2, forKey: "type")
        
        let item2 = NSManagedObject(entity: entity, insertInto: context)
        item2.setValue(2, forKey: "id")
        item2.setValue("TV", forKey: "name")
        item2.setValue(38000, forKey: "price")
        item2.setValue(2, forKey: "quantity")
        item2.setValue(2, forKey: "type")
        
        let item3 = NSManagedObject(entity: entity, insertInto: context)
        item3.setValue(3, forKey: "id")
        item3.setValue("Table", forKey: "name")
        item3.setValue(12000, forKey: "price")
        item3.setValue(1, forKey: "quantity")
        item3.setValue(2, forKey: "type")

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}


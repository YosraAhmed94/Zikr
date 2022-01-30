//
//  Zikr_AzkerApp.swift
//  Shared
//
//  Created by Yousra Ahmed on 14/12/2021.
//

import SwiftUI
import CoreData

@main
struct Zikr_AzkerApp: App {
    let persistence = PersistenceManager()
    var body: some Scene {
        WindowGroup {
            //AzkariList()
            let context = persistentContainer.viewContext
            ContentView().environment(\.managedObjectContext, context)
        }
    }
}

var persistentContainer: NSPersistentContainer = {
  let container = NSPersistentContainer(name: "Zikr Azker")
  container.loadPersistentStores { _, error in
    if let error = error as NSError? {
      // You should add your own error handling code here.
      fatalError("Unresolved error \(error), \(error.userInfo)")
    }
  }
  return container
}()

class PersistenceManager {
    lazy var persistentContainer: NSPersistentContainer = {
      // 2
      let container = NSPersistentContainer(name: "Zikr Azker")
      // 3
      container.loadPersistentStores { store, error in
          print(store)
        // 4
        if let error = error as NSError? {
          // You should add your own error handling code here.
          fatalError("Unresolved error \(error), \(error.userInfo)")
        }
      }
      return container
    }()
    func saveContext() {
      // 1
      let context = persistentContainer.viewContext
      // 2
      if context.hasChanges {
        do {
          // 3
          try context.save()
        } catch {
          // 4
          // The context couldn't be saved.
          // You should add your own error handling here.
          let nserror = error as NSError
          fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
      }
    }

    
  //  The old version of the Core Data stack generated in your AppDelegate contains one extra feature which is to automatically save any changes when your application goes to the background. You can mimic this behavior by listening for the UIApplication.willResignActiveNotification on NotificationCenter.default.
  init() {
    let center = NotificationCenter.default
    let notification = UIApplication.willResignActiveNotification

    center.addObserver(forName: notification, object: nil, queue: nil) { [weak self] _ in
      guard let self = self else { return }

      if self.persistentContainer.viewContext.hasChanges {
        try? self.persistentContainer.viewContext.save()
      }
    }
  }
}


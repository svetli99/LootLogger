//
//  ItemStore.swift
//  LootLogger
//
//  Created by Svetlio on 6.04.21.
//

import UIKit
import CoreData

class ItemStore {
    static let shared = ItemStore()
    var allItems = [Item]()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "LootLogger")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error setting up Core Data (\(error)).")
            }
        }
        return container
    }()
    
    init() {
        loadItems()
    }
    
    private func loadItems() {
        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
        let viewContext = persistentContainer.viewContext
        viewContext.performAndWait {
            do {
                self.allItems = try viewContext.fetch(fetchRequest)
            } catch {
                print("Error fetching allItems: \(error)")
            }
        }
    }
    
    @discardableResult func createItem() -> Item {
        
        let context = persistentContainer.viewContext
        let newItem = Item.createRandomItem(context: context)
        allItems.append(newItem)
        do {
            try self.persistentContainer.viewContext.save()
        } catch {
            print("Error saving allItems: \(error)")
        }
        return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
            let context = persistentContainer.viewContext
            context.delete(item)
            do {
                try self.persistentContainer.viewContext.save()
            } catch {
                print("Error saving allItems: \(error)")
            }
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        let movedItem = allItems[fromIndex]
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }
}

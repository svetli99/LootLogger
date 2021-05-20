//
//  Item+CoreDataClass.swift
//  LootLogger
//
//  Created by Svetoslav Kanchev on 12.05.21.
//
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    static func createRandomItem(context: NSManagedObjectContext) -> Item {
        
        let adjectives = ["Fluffy", "Rusty", "Shiny"]
        let nouns = ["Bear", "Spork", "Mac"]
        
        let randomAdjective = adjectives.randomElement()!
        let randomNoun = nouns.randomElement()!
        
        let randomName = "\(randomAdjective) \(randomNoun)"
        let randomValue = Int.random(in: 0..<100)
        let randomSerialNumber =
            UUID().uuidString.components(separatedBy: "-").first!
        
        var newItem: Item!
        context.performAndWait {
            newItem = Item(context: context)
            newItem.name = randomName
            newItem.valueInDollars = Int64(randomValue)
            newItem.dateCreated = Date()
            newItem.serialNumber = randomSerialNumber
            newItem.itemKey = UUID().uuidString
        }
        return newItem
    }
    
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
            && lhs.serialNumber == rhs.serialNumber
            && lhs.valueInDollars == rhs.valueInDollars
            && lhs.dateCreated == rhs.dateCreated
    }
}

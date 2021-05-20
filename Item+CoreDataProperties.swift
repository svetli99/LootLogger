//
//  Item+CoreDataProperties.swift
//  LootLogger
//
//  Created by Svetoslav Kanchev on 12.05.21.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var name: String?
    @NSManaged public var dateCreated: Date?
    @NSManaged public var serialNumber: String?
    @NSManaged public var valueInDollars: Int64
    @NSManaged public var itemKey: String?

}

extension Item : Identifiable {

}

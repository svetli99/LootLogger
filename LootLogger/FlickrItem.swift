////
////  Item.swift
////  LootLogger
////
////  Created by Svetlio on 6.04.21.
////
//
//import UIKit
//
//class FlickrItem: Equatable, Codable {
//    var name: String
//    var valueInDollars: Int
//    var serialNumber: String?
//    var dateCreated: Date
//    let itemKey: String
//    
//    init(name: String, serialNumber: String?, valueInDollars: Int) {
//        self.name = name
//        self.valueInDollars = valueInDollars
//        self.serialNumber = serialNumber
//        self.dateCreated = Date()
//        self.itemKey = UUID().uuidString
//    }
//    
//    convenience init(random: Bool = false) {
//        if random {
//            let adjectives = ["Fluffy", "Rusty", "Shiny"]
//            let nouns = ["Bear", "Spork", "Mac"]
//
//            let randomAdjective = adjectives.randomElement()!
//            let randomNoun = nouns.randomElement()!
//
//            let randomName = "\(randomAdjective) \(randomNoun)"
//            let randomValue = Int.random(in: 0..<100)
//            let randomSerialNumber =
//                UUID().uuidString.components(separatedBy: "-").first!
//
//            self.init(name: randomName,
//                      serialNumber: randomSerialNumber,
//                      valueInDollars: randomValue)
//        } else {
//            self.init(name: "", serialNumber: nil, valueInDollars: 0)
//        }
//    }
//    
//    static func ==(lhs: FlickrItem, rhs: FlickrItem) -> Bool {
//        return lhs.name == rhs.name
//            && lhs.serialNumber == rhs.serialNumber
//            && lhs.valueInDollars == rhs.valueInDollars
//            && lhs.dateCreated == rhs.dateCreated
//    }
//    
//    static func items(fromJSON data: Data) -> Result<[FlickrItem], Error> {
//        do {
//            let decoder = JSONDecoder()
//            let items = try decoder.decode([FlickrItem].self, from: data)
//            return .success(items)
//        } catch {
//            return .failure(error)
//        }
//    }
//}

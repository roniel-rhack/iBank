//
//  Card.swift
//  iBank
//
//  Created by Admin on 10/18/20.
//

import Foundation
import CoreData


public class Card : NSManagedObject, Identifiable {
    @NSManaged public var name : String?
    @NSManaged public var number : String?
    @NSManaged public var vencto : Date?
}

extension Card{
    static func getAllCards() -> NSFetchRequest<Card> {
        let request : NSFetchRequest<Card> = Card.fetchRequest() as! NSFetchRequest<Card>
        let sortDescriptors = NSSortDescriptor(key: "number", ascending: true)
        request.sortDescriptors = [sortDescriptors]
        return request
    }
}

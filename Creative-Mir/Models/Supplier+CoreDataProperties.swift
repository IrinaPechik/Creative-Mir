//
//  Supplier+CoreDataProperties.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 17.12.2023.
//
//

import Foundation
import CoreData

@objc(Supplier)
public class Supplier: NSManagedObject {

}

extension Supplier {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Supplier> {
        return NSFetchRequest<Supplier>(entityName: "Supplier")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var position: String?
    @NSManaged public var secondName: String?
    @NSManaged public var experience: Int64
    @NSManaged public var avatarImage: String?
    @NSManaged public var email: String?

}

extension Supplier : Identifiable {

}

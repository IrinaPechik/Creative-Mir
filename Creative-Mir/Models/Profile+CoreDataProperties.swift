//
//  Profile+CoreDataProperties.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 08.12.2023.
//
//

import Foundation
import CoreData

@objc(Profile)
public class Profile: NSManagedObject {

}

extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var id: Int64
    @NSManaged public var firstName: String?
    @NSManaged public var secondName: String?
    @NSManaged public var avatarImage: String?

}

extension Profile : Identifiable {

}

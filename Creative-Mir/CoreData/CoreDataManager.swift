//
//  CoreDataManager.swift
//  Creative-Mir
//
//  Created by Печик Ирина on 08.12.2023.
//

import Foundation
import UIKit
import CoreData

public final class CoreDataManager: NSObject {
    public static let shared = CoreDataManager()
    private override init() {}
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }

    public func createProfile(_ id: Int64, firstName: String?, secondName: String?, avatar: String?) {
        guard let profileDescription = NSEntityDescription.entity(forEntityName: "Profile", in: context) else {
            return
        }
        let profile = Profile(entity: profileDescription, insertInto: context)
        
        profile.id = id
        profile.firstName = firstName
        profile.secondName = secondName
        profile.avatarImage = avatar
        
        appDelegate.saveContext()
    }
    
    public func fetchProfiles() -> [Profile] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        do {
            return (try? context.fetch(fetchRequest) as? [Profile]) ?? []
        }
    }
    
    public func fetchProfile(with id: Int64) -> Profile? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        do {
            let profiles = try? context.fetch(fetchRequest) as? [Profile]
            return profiles?.first
        }
    }
    
    public func updateProfile(with id: Int64, firstName: String?, secondName: String?, avatar: String?) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        do {
            guard let profiles = try? context.fetch(fetchRequest) as? [Profile],
                  let profile = profiles.first else {return}
            profile.firstName = firstName
            profile.secondName = secondName
            profile.avatarImage = avatar
        }
        
        appDelegate.saveContext()
    }
    
    public func deleteProfile(with id: Int64) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        do {
            guard let profiles = try? context.fetch(fetchRequest) as? [Profile],
            let profile = profiles.first else {return}
            context.delete(profile)
        }
        appDelegate.saveContext()
    }
}

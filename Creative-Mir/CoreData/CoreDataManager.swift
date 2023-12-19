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

    public func createProfile(firstName: String, secondName: String, avatar: String?, email: String, password: String, age: Int64, cityName: String) {
        guard let profileDescription = NSEntityDescription.entity(forEntityName: "Profile", in: context) else {
            return
        }
        let profile = Profile(entity: profileDescription, insertInto: context)
        
        profile.firstName = firstName
        profile.secondName = secondName
        profile.avatarImage = avatar
        profile.email = email
        profile.password = password
        profile.age = age
        profile.cityName = cityName
        
        appDelegate.saveContext()
    }
    
    public func fetchProfiles() -> [Profile] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        do {
            return (try? context.fetch(fetchRequest) as? [Profile]) ?? []
        }
    }
    
//    public func fetchProfile(with id: Int64) -> Profile? {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
//        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
//        do {
//            let profiles = try? context.fetch(fetchRequest) as? [Profile]
//            return profiles?.first
//        }
//    }
    
    public func fetchProfile(with email: String) -> Profile? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        do {
            let profiles = try? context.fetch(fetchRequest) as? [Profile]
            return profiles?.first
        }
    }

    public func updateProfile(firstName: String?, secondName: String?, avatar: String?, age: Int64, email: String?, cityName: String?) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        fetchRequest.predicate = NSPredicate(format: "email == %@", email!)
        do {
            guard let profiles = try? context.fetch(fetchRequest) as? [Profile],
                  let profile = profiles.first else {return}
            profile.firstName = firstName
            profile.secondName = secondName
            profile.avatarImage = avatar
            profile.email = email
            profile.age = age
            profile.cityName = cityName
        }
        
        appDelegate.saveContext()
    }
//    
//    public func deleteProfile(with id: Int64) {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
//        print(id)
//        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
//        do {
//            guard let profiles = try? context.fetch(fetchRequest) as? [Profile],
//            let profile = profiles.first else {return}
//            context.delete(profile)
//        }
//        appDelegate.saveContext()
//    }
    
    public func createSuppliers(firstName: String, secondName: String, position: String, experience: Int64, avatarImage: String, email: String) {
        guard let supplierDescription = NSEntityDescription.entity(forEntityName: "Supplier", in: context) else {
            return
        }
        let supplier = Supplier(entity: supplierDescription, insertInto: context)
        
        supplier.firstName = firstName
        supplier.secondName = secondName
        supplier.position = position
        supplier.experience = experience
        supplier.email = email
        supplier.avatarImage = avatarImage
        appDelegate.saveContext()
    }
    
    public func fetchSuppliers() -> [Supplier] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Supplier")
        do {
            return (try? context.fetch(fetchRequest) as? [Supplier]) ?? []
        }
    }
}

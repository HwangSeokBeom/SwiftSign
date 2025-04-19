//
//  CoreDataUser+CoreDataProperties.swift
//  SwiftSign
//
//  Created by Hwangseokbeom on 4/19/25.
//
//

import Foundation
import CoreData


extension CoreDataUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataUser> {
        return NSFetchRequest<CoreDataUser>(entityName: "CoreDataUser")
    }

    @NSManaged public var email: String?
    @NSManaged public var password: String?
    @NSManaged public var nickname: String?

}

extension CoreDataUser : Identifiable {

}

//
//  Post+CoreDataProperties.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 28/11/20.
//

import Foundation
import CoreData

extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var body: String?
    @NSManaged public var id: Int64
    @NSManaged public var isFavourite: Bool
    @NSManaged public var title: String?
    @NSManaged public var userID: Int64

}

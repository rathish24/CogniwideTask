//
//  Post+CoreDataClass.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 28/11/20.
//

import Foundation
import CoreData

@objc(Post)
public class Post: NSManagedObject, Codable {

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(body ?? "blank", forKey: .body)
        } catch {
            print("error")
        }
    }

    required convenience public init(from decoder: Decoder) throws {
        // return the context from the decoder userinfo dictionary
        guard let contextUserInfoKey = CodingUserInfoKey.context,
        let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
        let entity = NSEntityDescription.entity(forEntityName: "Post", in: managedObjectContext)
        else {
            fatalError("decode failure")
        }
        // Super init of the NSManagedObject
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            userID = try values.decode(Int64.self, forKey: .userID)
            id = try values.decode(Int64.self, forKey: .id)
            title = try values.decode(String.self, forKey: .title)
            body = try values.decode(String.self, forKey: .body)
            isFavourite = false
        } catch {
            print ("error")
        }
    }

    enum CodingKeys: String, CodingKey {
              case userID = "userId"
              case id, title, body , isFavourite
          }
}

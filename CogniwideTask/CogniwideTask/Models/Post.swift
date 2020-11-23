//
//  Post.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 22/11/20.
//

import Foundation

struct Post: Codable {
    let userID, id: Int
       let title, body: String

       enum CodingKeys: String, CodingKey {
           case userID = "userId"
           case id, title, body
       }
}

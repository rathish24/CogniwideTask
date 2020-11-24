//
//  PostModel.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 23/11/20.
//

import Foundation

import Foundation

import CoreData

extension PostModel {
    class func getAllShows() -> Array<PostModel> {
           let all = NSFetchRequest<PostModel>(entityName: "PostModel")
           var allShows = [PostModel]()
           do {
            let fetched = try CoreDataStack.sharedInstance.persistentContainer.viewContext.fetch(all)
            allShows = fetched
           } catch {
               let nserror = error as NSError
               //TODO: Handle Error
               print(nserror.description)
           }
           return allShows
       }

}

//
//  PostViewModel.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 22/11/20.
//

import Foundation
import Alamofire
import RxSwift
import CoreData

class PostViewModel {
    var data = [NSManagedObject]()
    let items = PublishSubject<[NSManagedObject]>()
    func fetchPostList() {
       
        APIClient.sharedInstance.getPost { [weak self] (posts, status, message) in
            if status {
                DispatchQueue.main.async { [weak self] in
                    CoreDataStack.sharedInstance.saveContext()
                    self?.loadSavedData()
                }
            }
        }
    }
    func loadSavedData() {
        let request: NSFetchRequest<Post> = Post.fetchRequest()
        do {
            data = try CoreDataStack.sharedInstance.persistentContainer.viewContext.fetch(request)
            self.items.onNext(data)
            self.items.onCompleted()
        } catch {
            print("Fetch failed")
        }
    }
    func saveFavouritePost(_ id: Int64, _ isFavourite: Bool){
        let fetchRequest: NSFetchRequest<Post> = Post.fetchRequest()
        let predicate = NSPredicate(format: "id == %i", id)
        fetchRequest.predicate = predicate
        fetchRequest.returnsObjectsAsFaults = false
        do {
            data = try CoreDataStack.sharedInstance.persistentContainer.viewContext.fetch(fetchRequest)
            let favObj = data[0]
            print("favObj :::: \(favObj)")
            favObj.setValue(isFavourite, forKey: "isFavourite")
            CoreDataStack.sharedInstance.saveContext()
        } catch {
            print("Fetch failed")
        }
        
    }

}

//
//  FavouriteViewModel.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 28/11/20.
//

import Foundation
import CoreData
import RxSwift

class FavouriteViewModel {
    var data = [NSManagedObject]()
    let items = PublishSubject<[NSManagedObject]>()
    
    func fetchPostList() {
        print("fetchPostList called============")
        let fetchRequest: NSFetchRequest<Post> = Post.fetchRequest()
        let predicate = NSPredicate(format: "isFavourite == %@", NSNumber(value: true))
        fetchRequest.predicate = predicate
        fetchRequest.returnsObjectsAsFaults = false
        do {
            data = try CoreDataStack.sharedInstance.persistentContainer.viewContext.fetch(fetchRequest)
            print("data called============ \(data)")
            self.items.onNext(data)
            self.items.onCompleted()
        } catch {
            print("Fetch failed")
        }
    }
}

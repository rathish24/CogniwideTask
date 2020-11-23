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
    let items = PublishSubject<[Post]>()
    func fetchPostList() {
        APIClient.getPosts { result in
            switch result {
            case .success(let posts):
                self.items.onNext(posts)
                self.items.onCompleted()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

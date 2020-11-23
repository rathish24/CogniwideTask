//
//  APIClient.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 22/11/20.
//

import Foundation
import RxSwift
import Alamofire

class APIClient {

    @discardableResult
       private static func performRequest<T:Decodable>(route:APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
           return AF.request(route)
                           .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                               completion(response.result)
           }
       }
       
       static func getPosts(completion:@escaping (Result<[Post], AFError>)->Void) {
           performRequest(route: APIRouter.posts, completion: completion)
       }
}

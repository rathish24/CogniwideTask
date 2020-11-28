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

    static let sharedInstance = APIClient()
    func getPost(completion: @escaping (_ countries: [Post]?, _ status: Bool, _ message: String) -> Void) {
        AF.request(APIRouter.posts).response { (responseData) in
            guard let data = responseData.data else {
                completion(nil, false, "")
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.userInfo[CodingUserInfoKey.context!] = CoreDataStack.sharedInstance.persistentContainer.viewContext
                let postData = try decoder.decode([Post].self, from: data)// Commit rather than CommmitData
                completion(postData, true, "")
            } catch {
                completion(nil, false, error.localizedDescription)
            }
        }
    }


}

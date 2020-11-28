//
//  Constants.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 22/11/20.
//

import Foundation
struct Constants {
    struct ProductionServer {
        static let baseURL = "https://jsonplaceholder.typicode.com"
    }
    
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}

enum UserDefaultsKeys: String {
    case isLoggedIn
}

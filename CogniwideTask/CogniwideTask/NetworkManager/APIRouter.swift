//
//  APIRouter.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 22/11/20.
//

import Foundation
import Alamofire


enum APIRouter: URLRequestConvertible {
    
        case posts
        
        // MARK: - HTTPMethod
        private var method: HTTPMethod {
            switch self {
            case .posts:
                return .get
            }
        }
        
        // MARK: - Path
        private var path: String {
            switch self {
            case .posts:
                return "/posts"
            }
        }
        
        // MARK: - Parameters
        private var parameters: Parameters? {
            switch self {
            case .posts:
                return nil
            }
        }
        
        // MARK: - URLRequestConvertible
        func asURLRequest() throws -> URLRequest {
            let url = try Constants.ProductionServer.baseURL.asURL()
            
            var urlRequest = URLRequest(url: url.appendingPathComponent(path))
            
            // HTTP Method
            urlRequest.httpMethod = method.rawValue
            
            // Common Headers
            urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
            urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
            
            // Parameters
            if let parameters = parameters {
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                } catch {
                    throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
                }
            }
            
            return urlRequest
        }
}

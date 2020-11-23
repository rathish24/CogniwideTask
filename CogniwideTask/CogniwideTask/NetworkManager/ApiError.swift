//
//  ApiError.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 22/11/20.
//

import Foundation
enum ApiError: Error {
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
}

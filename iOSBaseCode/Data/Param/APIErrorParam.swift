//
//  APIErrorParam.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 26/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import ObjectMapper

class ApiError: Mappable {
    var statusCode: Int!
    var error: String!
    var errorDesc: String!
    var message: String?
    
    func content() -> String {
        guard let error  = self.error else {
            guard let message = self.message else {
                return "Unknown error."
            }
            return message
        }
        guard let errorCode = Int(error) else {
            if errorDesc == "Bad credentials" {
                return "Login failed. Please enter correct username and password."
            }
            return errorDesc ?? "An error occured."
        }
        return (Int(errorCode).getErrorMessage()) + " (\(error))"
    }
    
    init() {
    }
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        statusCode <- map["statusCode"]
        error <- map["error"]
        errorDesc <- map["error_description"]
        message <- map["message"]
    }
    
}

extension ApiError: Swift.Error, LocalizedError {
    var errorDescription: String? {
        return content()
    }
    
}

//
//  Contants.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 26/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import ObjectMapper
import SwiftKeychainWrapper

class Constants{
    static let instance = Constants()
    static let baseURL:String = "http://localhost:8080";
    struct Keys {
        static let user = "user"
        static let passwordGrantedToken = "passwordGrantedToken"
        static let refreshToken = "refreshToken"
        static let clientCredentialsToken = "clientCredentialsToken"
        static let fcmToken = "fcmToken"
        static let baseUrl = "baseUrl"
    }
    var refreshToken: String? {
        get {
            return KeychainWrapper.standard.string(forKey: Keys.refreshToken)
        }
        set {
            KeychainWrapper.standard.set(newValue!, forKey: Keys.refreshToken)
        }
    }
    
    
    
    
    
}

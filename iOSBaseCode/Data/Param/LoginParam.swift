//
//  Login.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 26/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import ObjectMapper

class LoginParam: Mappable {
    struct defaultValues {
        static let grantType = "password"
        static let scope = "read write"
    }
    var username: String?
    var password: String?
    var grantType: String?
    var scope: String?
    init(username: String, password: String){
        self.username = username
//use this when you acquire public key from your server
//        let encryptor = StringEncryptor()
//        self.password = encryptor.encrypt(message: password)
        self.password=password;
        self.grantType = defaultValues.grantType
        self.scope = defaultValues.scope
    }
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        username <- map["username"]
        password <- map["password"]
        grantType <- map["grant_type"]
        scope <- map["scope"]
    }
    
}

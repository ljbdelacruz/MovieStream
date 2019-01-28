//
//  LoginResponse.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 26/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import ObjectMapper
class LoginResponse: Mappable {
    var accessToken: String?
    var expiration: String?
    var refreshToken: String?
    var scope: String?
    var tokenType: String?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        accessToken <- map["access_token"]
        expiration <- map["expires_in"]
        refreshToken <- map["refresh_token"]
        scope <- map["scope"]
        tokenType <- map["token_type"]
    }
}

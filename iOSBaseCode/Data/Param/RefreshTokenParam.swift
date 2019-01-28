//
//  RefreshTokenParam.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 26/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import ObjectMapper

class RefreshTokenParam: Mappable {
    var grantType = "refresh_token"
    var refreshToken: String?
    init(refreshToken: String) {
        self.refreshToken = refreshToken
    }
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        grantType <- map["grant_type"]
        refreshToken <- map["refresh_token"]
    }
}

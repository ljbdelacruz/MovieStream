//
//  ShowsResponse.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 27/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import ObjectMapper

class ShowResponseSummary: Mappable{
    var shows: [Shows]!
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        shows <- map["shows"]
    }
}
class Shows: Mappable {
    var id:Int?
    var title: String?
    var description: String?
    var profileImage: String?
    var isSeries: Int?;
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        profileImage <- map["profileImage"]
        isSeries <- map["isSeries"]
    }
}





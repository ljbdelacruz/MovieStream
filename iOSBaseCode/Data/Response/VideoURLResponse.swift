//
//  VideoURLResponse.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 05/02/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import ObjectMapper

class VideoURLResponse: Mappable {
    var id:Int?
    var title:String?;
    var summary: String?;
    var shows_id: Int?;
    var url:String?;
    var previewImage:String?;
    var ordinalOrder:Int?;
    var createdAt:Date?;
    var updatedAt:Date?;
    
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        summary <- map["summary"]
        shows_id <- map["shows_id"]
        url <- map["url"]
        ordinalOrder <- map["ordinalOrder"]
        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
    }
}

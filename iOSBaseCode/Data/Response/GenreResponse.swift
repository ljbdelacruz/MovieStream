//
//  GenreResponss.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 05/02/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import ObjectMapper

class ShowGenreResponse: Mappable {
    var id:Int?
    var shows_id:Int?;
    var genre_id: Int?;
    var genre:GenreResponse?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        id <- map["id"]
        shows_id <- map["shows_id"]
        genre_id <- map["genre_id"]
    }
}
class GenreResponse: Mappable{
    var id:Int?
    var title:String?;
    var description:String?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
    }
}

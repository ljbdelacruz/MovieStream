//
//  MoviesResponse.swift
//  
//
//  Created by Lainel John Dela Cruz on 28/01/2019.
//
import ObjectMapper
class MovieResponse: Mappable {
    var id:String?;
    var title:String?;
    var summary:String?;
    required init?(map: Map) {
    }
    init(id:String, title:String, summary:String){
        self.id=id;
        self.title=title;
        self.summary=summary;
    }
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        summary <- map["summary"]
    }
}

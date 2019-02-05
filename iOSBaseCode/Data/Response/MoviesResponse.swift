//
//  MoviesResponse.swift
//  
//
//  Created by Lainel John Dela Cruz on 28/01/2019.
//
import ObjectMapper
class MovieResponse: Mappable {
    var id:Int?;
    var title:String?;
    var description:String?;
    var posterImage:String?
    var promoImage:String?;
    var videoPromo:String?;
    var isSeries:Int?;
    required init?(map: Map) {
    }
    init(id:Int){
        self.id=id;
    }
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        promoImage <- map["profileImage"]
        videoPromo <- map["videoPromo"]
        isSeries <- map["isSeries"]
    }
}

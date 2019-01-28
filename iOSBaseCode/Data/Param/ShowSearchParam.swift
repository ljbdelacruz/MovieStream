//
//  ShowSearchParam.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 27/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import ObjectMapper

class ShowSearchParam: Mappable {
    var title: String?
    init(title:String){
        self.title=title;
    }
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        title <- map["title"]
    }
    
}

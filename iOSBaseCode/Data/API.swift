//
//  API.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 24/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import Alamofire
import Moya
import ObjectMapper
import FCUUID

class MyAPI: MoyaProvider<MyService> {
    init() {
        
    }
}


enum MyService  {
    case login(params:LoginParam)
    case showSearch(params:ShowSearchParam)
    case allMovies()
}

extension MyService: TargetType {
    var baseURL: URL {
        return URL(string: Constants.baseURL)!;
    }
    
    var path: String {
        switch self{
            case .login:
                return "/dummy/user/auth"
            case .showSearch(let params):
                print(params.title!);
                return "dummy/shows/"+params.title!
            //movies
        case .allMovies:
            return "dummy/movies";
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post;
        case .showSearch, .allMovies:
            return .get;
        }
    }
    var sampleData: Data {
        return "{}".data(using: .utf8)!
    }
    var task: Task {
        switch self{
        case .login(let params):
            return .requestParameters(parameters: params.toJSON(), encoding: URLEncoding(destination: .httpBody))
        case .showSearch, .allMovies:
            return .requestPlain
        }
        
    }
    
    var headers: [String : String]? {
        //MARK: - API Guard access
        var headerBasicAuthUser: String {
            // to be used for when the user is already logged in
//            return "Basic Y29tLmFlb25jcmVkaXQuYWVvbnBheS5jb25zdW1lcjpjb25zdW1lcl9zMnBAMjAxOA=="
            return "";
        }
        var uuid=FCUUID.uuidForDevice()!;
        let uuidNotification = "FCM TOKEN SET HERE" // blank string for deleted token.
        switch self{
        case .login:
            return ["Authorization": headerBasicAuthUser,
                    "X-Device-Id": uuid,
                    "X-Device-Notification-Id": uuidNotification,
                    "Content-Type": "application/x-www-form-urlencoded"]
        case .showSearch, .allMovies:
            return ["Content-Type": "application/x-www-form-urlencoded"]
        }
    }

}




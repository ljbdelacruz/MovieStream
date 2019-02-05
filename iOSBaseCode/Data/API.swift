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
    //movie
    case allMovies()
    case getMovieInfo(id:Int)
    case allMovieWithLimit(limit:Int)
    case getMovieSearchByTitle(title:String, limit:Int)
    //genre
    case getAllGenre(limit:Int)
    case getGenreByID(id:Int)
    //videoURL
    case getVideoInfo(id:String)
    case getVideoByShowID(id:String)
    //showGenre
    case getShowGenreByShowID(id:String)
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
                return "dummy/shows/"+params.title!
        //movies
        case .allMovies:
            return "dummy/movies";
        case .getMovieInfo(let param):
            return "vstream/movie/detail/\(param)";
        case .allMovieWithLimit(let limit):
            return "vstream/movies/\(limit)"
        case .getMovieSearchByTitle(let title, let limit):
            return "vstream/movies/\(title)/\(limit)";
        //genre
        case .getAllGenre(let limit):
            return "vstream/genre/\(limit)";
        case .getGenreByID(let id):
            return "vstream/genre/\(id)"
        //videoInfo
        case .getVideoInfo(let id):
            return "vstream/show/video/\(id)"
        case .getVideoByShowID(let id):
            return "vstream/show/video/list/\(id)";
        //showGenre
        case .getShowGenreByShowID(let id):
            return "vstream/show/genre/\(id)";
        }
        
        
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post;
        case .showSearch, .allMovies, .getMovieInfo, .allMovieWithLimit, .getMovieSearchByTitle,
            //genre
            .getGenreByID, .getAllGenre,
            //videoURL
            .getVideoInfo, .getVideoByShowID,
            //showGenre
            .getShowGenreByShowID
            :
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
        case .showSearch, .allMovies, .getMovieInfo, .allMovieWithLimit, .getMovieSearchByTitle,
             //genre
            .getGenreByID, .getAllGenre,
            //videoURL
            .getVideoInfo, .getVideoByShowID,
            //showGenre
            .getShowGenreByShowID:
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
        //get the uuid device id
        var uuid=FCUUID.uuidForDevice()!;
        let uuidNotification = "FCM TOKEN SET HERE" // blank string for deleted token.
        switch self {
        case .login:
            return ["Authorization": headerBasicAuthUser,
                    "X-Device-Id": uuid,
                    "X-Device-Notification-Id": uuidNotification,
                    "Content-Type": "application/x-www-form-urlencoded"]
        case .showSearch, .allMovies, .getMovieInfo, .allMovieWithLimit, .getMovieSearchByTitle,
             //genre
            .getGenreByID, .getAllGenre,
            //videoURL
            .getVideoInfo, .getVideoByShowID,
            //showGenre
            .getShowGenreByShowID:
            return ["Content-Type": "application/x-www-form-urlencoded"]
        }
    }

}




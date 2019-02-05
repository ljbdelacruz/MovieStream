//
//  MoviesRepo.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 28/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper


class MoviesRepository {
    private let service: MyAPI!
    init(service: MyAPI) {
        self.service = service
    }
    func all() -> Observable<[MovieResponse]> {
        return service.rx.request(.allMovies())
            .asObservable()
            .mapErrors(provider: service)
            .mapArray(MovieResponse.self).map({ resp in
                return resp;
            })
    }
    func getByInfo(id:Int) -> Observable<MovieResponse> {
        return service.rx.request(.getMovieInfo(id: id))
            .asObservable()
            .mapErrors(provider: service)
            .mapObject(MovieResponse.self).map({ resp in
                return resp;
            })
    }
    func getMoviesWithLimit(limit:Int) -> Observable<[MovieResponse]> {
        return service.rx.request(.allMovieWithLimit(limit: limit))
            .asObservable()
            .mapErrors(provider: service)
            .mapArray(MovieResponse.self).map({ resp in
                return resp;
            })
    }
    func getMoviesByTitle(title:String, limit:Int) -> Observable<[MovieResponse]> {
        return service.rx.request(.getMovieSearchByTitle(title: title, limit:limit))
            .asObservable()
            .mapErrors(provider: service)
            .mapArray(MovieResponse.self).map({ resp in
                return resp;
            })
    }
    
}

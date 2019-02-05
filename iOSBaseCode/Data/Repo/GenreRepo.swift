//
//  GenreRepo.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 05/02/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper

class GenreRespository {
    private let service: MyAPI!
    init(service: MyAPI) {
        self.service = service
    }
    func all(limit:Int) -> Observable<[GenreResponse]> {
        return service.rx.request(.getAllGenre(limit: limit))
            .asObservable()
            .mapErrors(provider: service)
            .mapArray(GenreResponse.self).map({ resp in
                return resp;
            })
    }
    func getGenreByID(id:Int) -> Observable<GenreResponse>{
        return service.rx.request(.getGenreByID(id: id))
            .asObservable()
            .mapErrors(provider: service)
            .mapObject(GenreResponse.self).map({ resp in
                return resp;
            })
    }
    func getShowGenreByID(id:String) -> Observable<[ShowGenreResponse]> {
        return service.rx.request(.getShowGenreByShowID(id: id))
            .asObservable()
            .mapErrors(provider: service)
            .mapArray(ShowGenreResponse.self).map({ resp in
                return resp;
            })
    }
}

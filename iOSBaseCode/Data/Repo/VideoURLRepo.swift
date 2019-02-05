//
//  VideoURLRepo.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 05/02/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper

class VideoURLRepository {
    private let service: MyAPI!
    init(service: MyAPI) {
        self.service = service
    }
    func getByID(id:String) -> Observable<VideoURLResponse> {
        return service.rx.request(.getVideoInfo(id: id))
            .asObservable()
            .mapErrors(provider: service)
            .mapObject(VideoURLResponse.self).map({ resp in
                return resp;
            })
    }
    func getByShowID(id:String)->Observable<[VideoURLResponse]>{
        return service.rx.request(.getVideoByShowID(id: id))
            .asObservable()
            .mapErrors(provider: service)
            .mapArray(VideoURLResponse.self).map({ resp in
                return resp;
            })
    }
}



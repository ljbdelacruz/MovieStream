//
//  ShowsRepo.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 27/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Moya_ObjectMapper


class ShowsRepository {
    private let service: MyAPI!
    init(service: MyAPI) {
        self.service = service
    }
    func showSearch(params: ShowSearchParam) -> Observable<ShowResponseSummary> {
        return service.rx.request(.showSearch(params:params))
            .asObservable()
            .mapErrors(provider: service)
            .mapObject(ShowResponseSummary.self).map({ (response) in
                return response
            })
     }
}

//
//  ErrorOperator.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 26/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Moya
import RxSwift

extension ObservableType where E == Response {
    func mapErrors(provider: MyAPI) -> Observable<E> {
        //getting refresh token token
//        var refreshTokenRequest: Observable<Response>?
        if let refreshToken = Constants.instance.refreshToken {
            let param = RefreshTokenParam(refreshToken: refreshToken)
//            refreshTokenRequest = provider.request(.refereshToken(param: param)).asObservable()
        }
        return self.filterSuccessfulStatusCodes()
            .catchError { e in
                throw e;
        }
        
    }
}

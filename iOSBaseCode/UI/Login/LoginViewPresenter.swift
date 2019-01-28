//
//  LoginViewPresenter.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 24/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import RxSwift


protocol LoginView: BaseView {
    func showAuthSuccess();
    func showAuthFailed(message:String);
}

class LoginPresenter: BasePresenter {
    private let disposeBag: DisposeBag
    private let userRepository: UserRepository
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
        self.disposeBag = DisposeBag()
    }
    func getView() -> LoginView? {
        return view as? LoginView
    }
    
    func Authorize(email:String, password:String){
        let param=LoginParam(username: email, password: password);
        self.userRepository.login(params: param).subscribe(onNext: { user in
            print(user.accessToken);
            print(user.tokenType);
            print(user.scope);
            self.getView()?.showAuthSuccess()
            }, onError: { (error) in
                self.getView()?.showAuthFailed(message: error.localizedDescription)
            }
            ).disposed(by: disposeBag)
    }
    
    
}

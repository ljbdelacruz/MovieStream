//
//  DataAssembly.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 24/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import Swinject
import SwinjectAutoregistration
//import Moya

class DataAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(MyAPI.self) { (r) in
            let service = MyAPI()
            return service
        }
        // Repository
        container.autoregister(UserRepository.self, initializer: UserRepository.init).inObjectScope(.container)
        container.autoregister(ShowsRepository.self, initializer: ShowsRepository.init).inObjectScope(.container)
        container.autoregister(MoviesRepository.self, initializer: MoviesRepository.init).inObjectScope(.container)
    }
}

//
//  AppAssembler.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 24/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation


import Swinject
import SwinjectStoryboard

class AppAssembler {
    
    static let instance = AppAssembler()
    
    let assembler = try! Assembler(assemblies: [
        DataAssembly(),
        PresentationAssembly()
        ], container: SwinjectStoryboard.defaultContainer)
}

extension AppAssembler {
    func initialViewController() -> LoginViewController {
        let sb = SwinjectStoryboard.create(name: "Main", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! LoginViewController
        return vc
    }
}

extension UIViewController {
    var assembler: AppAssembler { return AppAssembler.instance }
}

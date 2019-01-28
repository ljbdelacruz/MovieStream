//
//  MVP.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 24/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//
import Foundation
import UIKit

protocol BaseView: class {
}
class BasePresenter {
    
    weak var view: BaseView?
    
    func attachView(view: BaseView) {
        self.view = view
    }
    
    // no need to call this
    // since view has a weak reference
    func detachView() {
        self.view = nil
    }
    
}

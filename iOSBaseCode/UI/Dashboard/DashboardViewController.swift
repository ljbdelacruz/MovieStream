//
//  DashboardViewController.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 26/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    var presenter: DashboardPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.attachView(view: self);
    }
}

extension DashboardViewController:BaseView{
    
}

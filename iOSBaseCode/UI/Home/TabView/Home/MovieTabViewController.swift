//
//  MovieTabViewController.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 05/02/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class MovieTabViewController: UITabBarController {
    var movieInfo:MovieResponse?;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func inject(movieInfo:MovieResponse){
        self.movieInfo=movieInfo;
    }


}

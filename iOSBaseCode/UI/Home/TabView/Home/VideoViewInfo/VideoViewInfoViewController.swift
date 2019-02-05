//
//  VideoViewInfoViewController.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 05/02/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class VideoViewInfoViewController: UIViewController {
    var movieDetail:MovieResponse?;
    var videoURL:VideoURLResponse?;
    var presenter:VideoInfoViewPresenter!;
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.presenter?.attachView(view: self);
    }
    func injectValue(movieDetail:MovieResponse, videoURL:VideoURLResponse){
        self.movieDetail=movieDetail;
        self.videoURL=videoURL;
    }    
    @IBAction func BackOnClick(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil);
    }
}


extension VideoViewInfoViewController:VideoInfoView{
    func getMovieReviewSuccess() {
        //get list of reviews for this video
    }
    
    
}

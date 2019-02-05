//
//  MovieDetailViewController.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 28/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit
import WebKit

class MovieDetailViewController: BaseViewController {
    var presenter:MovieDetailPresenter!;
    var id:Int?;
    @IBOutlet weak var UITitleLable: UILabel!
    @IBOutlet weak var UISummaryText: UITextView!
    @IBOutlet weak var navbar: UINavigationBar!
    override func viewDidLoad(){
        super.viewDidLoad()
        presenter.attachView(view: self)
        presenter.movieDetail?.id=self.id;
        presenter.GetMovieDetail();
        presenter.GetMovieGenres(id: "\(id!)")
        presenter.GetVideoURL(show_id: "\(id)")
        self.initNavbar()
    }
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    
}
extension MovieDetailViewController:MovieDetailView{
    func getVideoSuccess() {
        print("Movies Available");
        print(self.presenter.movieVideo.count);
    }
    func getMovieGenreSuccess() {
        print("Movie Genre");
        print(self.presenter.movieGenre.count);
    }
    func getMovieDetailSuccess() {
        self.UITitleLable.text=self.presenter.movieDetail?.title;
        self.UISummaryText.text=self.presenter.movieDetail?.description;
//        self.UIPosterImage.image=self.FetchImage(imgurl: movie.posterImage!, nimageURL: "niimage");
//        self.UIPromoImage.image=self.FetchImage(imgurl: movie.promoImage!, nimageURL: "niimage");
    }
    func FetchImage(imgurl:String, nimageURL:String)->UIImage{
        let url=URL(string: imgurl);
        if(url != nil){
            let data = try? Data(contentsOf: url!)
            if let imageData = data {
                return UIImage(data: imageData)!;
            }else{
                return UIImage(named: "nimage")!
            }
        }
        return UIImage();
    }
}
//MARK: Movie Detail
extension MovieDetailViewController{
    func initNavbar(){
        self.backButton.action=#selector(back);
    }
    
    @objc func back(){
        self.presentingViewController?.dismiss(animated: true, completion: nil);
    }
    
}


//
//  EpisodeListViewController.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 05/02/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class EpisodeListViewController: UIViewController {
    var presenter:MovieDetailPresenter!;
    var selectedV:VideoURLResponse?;
    var id:String?;
    @IBOutlet weak var UITitleLabel: UILabel!
    @IBOutlet weak var UIEpisodeTV: UITableView!
    override func viewDidLoad(){
        super.viewDidLoad()
        self.presenter.attachView(view: self);
        self.setupTV()
        self.setupTabViewData()
    }
    func injectvalue(movieDetail:MovieResponse){
        self.presenter.movieDetail=movieDetail;
        self.UITitleLabel.text=self.presenter.movieDetail?.title;
        self.presenter.GetVideoURL(show_id: "\(self.presenter.movieDetail!.id!)");
    }
    @IBAction func BackOnClick(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil);
    }
}
//MARK: presenter handler
extension EpisodeListViewController:MovieDetailView{
    func getVideoSuccess() {
        print("Episodes")
        print(self.presenter.movieVideo.count);
        self.UIEpisodeTV.reloadData();
    }
}
//MARK: TableView Setup
extension EpisodeListViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        self.selectedV=self.presenter.movieVideo[indexPath.row];
        self.performSegue(withIdentifier: "viewVideoSegue", sender: nil);
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.movieVideo.count ?? 0;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=self.UIEpisodeTV.dequeueReusableCell(withIdentifier: "showsCell", for: indexPath);
        cell.textLabel?.text=self.presenter?.movieVideo[indexPath.row].title;
        return cell;
    }
    func setupTV(){
        self.UIEpisodeTV.delegate=self;
        self.UIEpisodeTV.dataSource=self;
    }
}

extension EpisodeListViewController{
    func setupTabViewData(){
        let tbc=self.tabBarController as! MovieTabViewController;
        self.injectvalue(movieDetail: tbc.movieInfo!);
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "viewVideoSegue"{
            let vc=segue.destination as! VideoViewInfoViewController;
            vc.injectValue(movieDetail: self.presenter.movieDetail!, videoURL: self.selectedV!);
        }
    }
}

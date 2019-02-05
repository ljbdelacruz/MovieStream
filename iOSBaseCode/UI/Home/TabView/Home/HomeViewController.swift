//
//  HomeViewController.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 27/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var presenter: HomeViewPresenter!
    var selectedMovie:MovieResponse?;
    
    @IBOutlet weak var UIActivityI: UIActivityIndicatorView!
    @IBOutlet weak var UIShowSB: UISearchBar!
    @IBOutlet weak var UIShowListTV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.UIShowListTV.delegate=self;
        self.UIShowListTV.dataSource=self;
        self.UIShowSB.delegate=self;
        self.UIShowListTV.register(UITableViewCell.self, forCellReuseIdentifier: "showsCell");
        presenter.attachView(view: self);
        self.presenter.loadAllMovies(limit: 10);
        self.hideAI();
    }
}
//MARK: presenter responseHandler
extension HomeViewController : HomeView{
    func movieShowSuccess() {
        self.UIShowListTV.reloadData();
    }
    func showShowsSuccess(shows: [Shows]) {
        self.UIShowListTV.reloadData();
    }
    func failed(message:String){
        print(message);
    }
}
//MARK: TableViewDelegate
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.movies.count ;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=self.UIShowListTV.dequeueReusableCell(withIdentifier: "showsCell", for: indexPath);
        cell.textLabel?.text=self.presenter.movies[indexPath.row].title!;
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedMovie=self.presenter.movies[indexPath.row];
        performSegue(withIdentifier: "toMovieDetail", sender: nil);
    }
}
//MARK: SearchBar Func
extension HomeViewController: UISearchBarDelegate{
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.presenter.filterMovies(text: searchBar.text!, limit:5);
        self.UIShowListTV.reloadData();
    }
}
//MARK: Segue
extension HomeViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMovieDetail" {
            let vc=segue.destination as! MovieDetailViewController;
            print(self.selectedMovie);
            vc.id=self.selectedMovie?.id! ?? 0;
        }
    }
}
//MARK: UI Updater

extension HomeViewController{
    func showAI(){
        self.UIActivityI.isHidden=false;
        self.UIActivityI.startAnimating();
    }
    func hideAI(){
        self.UIActivityI.isHidden=true;
        self.UIActivityI.stopAnimating();
    }
}

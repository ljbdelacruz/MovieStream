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
        self.presenter.loadAllMovies();
    }
}
extension HomeViewController : HomeView{
    func movieShowSuccess(movies: [MovieResponse]) {
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
    }
}

extension HomeViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.presenter.filterMovies(text: searchBar.text!);
        self.UIShowListTV.reloadData();
    }
}

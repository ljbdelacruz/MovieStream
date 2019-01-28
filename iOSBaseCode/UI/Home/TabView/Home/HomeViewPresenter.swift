//
//  HomeViewPresenter.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 27/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import RxSwift


protocol HomeView: BaseView {
    func showShowsSuccess(shows:[Shows]);
    func movieShowSuccess(movies:[MovieResponse])
    func failed(message:String);
}
class HomeViewPresenter: BasePresenter {
    private let disposeBag: DisposeBag
    private let showsRepository: ShowsRepository
    private let moviesRepository: MoviesRepository;
    var movies:[MovieResponse]=[];
    var baseMovies:[MovieResponse]=[];
    init(showsRepository: ShowsRepository, moviesRepository:MoviesRepository) {
        self.showsRepository = showsRepository
        self.moviesRepository=moviesRepository;
        self.disposeBag = DisposeBag()
    }
    func getView() -> HomeView?{
        return view as? HomeView
    }    
    func loadByTitle(title:String){
        let param=ShowSearchParam(title: title);
        self.showsRepository.showSearch(params: param).subscribe(onNext: { shows in
            self.getView()?.showShowsSuccess(shows: shows.shows);
        }).disposed(by: disposeBag)
    }
    func loadAllMovies(){
        self.moviesRepository.all().subscribe({ shows in
            switch shows{
            case .next(_):
                self.baseMovies=shows.element ?? [];
                self.movies=shows.element ?? [];
                self.getView()?.movieShowSuccess(movies: shows.element ?? []);
            case .error(_):
                self.getView()?.failed(message: "Failed Getting Shows");
            case .completed:
                break;
            }
        }).disposed(by: disposeBag)
    }
    func filterMovies(text:String){
        if text.count <= 0{
            self.movies=self.baseMovies;
        }else{
            self.movies=self.baseMovies.filter({ return $0.title?.lowercased().contains(text.lowercased()) == true });
        }
    }
    
}

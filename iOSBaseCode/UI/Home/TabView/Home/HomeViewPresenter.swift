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
    func movieShowSuccess()
    func failed(message:String);
}
class HomeViewPresenter: BasePresenter {
    private let disposeBag: DisposeBag
    private let moviesRepository: MoviesRepository;
    var movies:[MovieResponse]=[];
    init(moviesRepository:MoviesRepository) {
        self.moviesRepository=moviesRepository;
        self.disposeBag = DisposeBag()
    }
    func getView() -> HomeView?{
        return view as? HomeView
    }    
    func loadAllMovies(limit:Int){
        self.moviesRepository.getMoviesWithLimit(limit: limit).subscribe({ shows in
            switch shows{
            case .next(_):
                self.movies=shows.element ?? [];
                self.getView()?.movieShowSuccess();
            case .error(_):
                self.getView()?.failed(message: "Failed Getting Shows");
            case .completed:
                break;
            }
        }).disposed(by: disposeBag)
    }
    func filterMovies(text:String, limit:Int){
        moviesRepository.getMoviesByTitle(title: text, limit: limit).subscribe({ shows in
            switch shows{
            case .next(_):
//                self.baseMovies=shows.element ?? [];
                self.movies=shows.element ?? [];
                self.getView()?.movieShowSuccess();
            case .error(_):
                self.getView()?.failed(message: "Failed Getting Shows");
            case .completed:
                break;
            }
        }).disposed(by: disposeBag)
    }
    
}

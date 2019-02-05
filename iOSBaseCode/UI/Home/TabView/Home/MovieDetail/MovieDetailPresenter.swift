//
//  MovieDetailPresenter.swift
//  iOSBaseCode
//
//  Created by Lainel John Dela Cruz on 28/01/2019.
//  Copyright © 2019 Lainel John Dela Cruz. All rights reserved.
//

import Foundation
import RxSwift
protocol MovieDetailView: BaseView {
    func getMovieDetailSuccess()
    func getMovieGenreSuccess();
    func getVideoSuccess();
    
}
class MovieDetailPresenter: BasePresenter {
    private let moviesRepository: MoviesRepository;
    private let genreRepository: GenreRespository;
    private let videoRepository: VideoURLRepository;
    private let disposeBag: DisposeBag
    var movieDetail:MovieResponse?;
    var movieGenre:[ShowGenreResponse]=[];
    var movieVideo:[VideoURLResponse]=[];
    
    init(moviesRepository:MoviesRepository, genreRepository:GenreRespository, videoRepo:VideoURLRepository) {
        self.movieDetail=MovieResponse(id:0);
        self.moviesRepository=moviesRepository;
        self.genreRepository=genreRepository;
        self.videoRepository=videoRepo;
        self.disposeBag = DisposeBag()
    }
    func getView() -> MovieDetailView?{
        return view as? MovieDetailView
    }
    func GetMovieDetail(){
        self.moviesRepository.getByInfo(id: self.movieDetail?.id ?? 0).subscribe(onNext: { movie in
            self.movieDetail=movie;
            self.getView()?.getMovieDetailSuccess();
        }).disposed(by: disposeBag)
    }
    
    func GetMovieGenres(id:String){
        self.genreRepository.getShowGenreByID(id: id)
        .subscribe(onNext: { showGenre in
            self.movieGenre=showGenre;
            self.movieGenre.forEach({ sgenre in
                //finds the specific genre of the show
                sgenre.genre=Constants.genres.first(where:{ return $0.id == sgenre.genre_id});
            })
            self.getView()?.getMovieGenreSuccess();
        }).disposed(by: disposeBag)
    }
    func GetVideoURL(show_id:String){
        self.videoRepository.getByShowID(id: show_id)
        .subscribe(onNext: { videoURLs in
            self.movieVideo=videoURLs;
            self.getView()?.getVideoSuccess();
        }).disposed(by: disposeBag)
    }
    
}



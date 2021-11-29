//
//  MoviesVM.swift
//  KLM_t
//
//  Created by Pavle Mijatovic on 26.5.21..
//

import UIKit

class MoviesVM {
    
    // MARK: - API
    var isLoadingScreenShown = true
    let backgroundColor = UIColor.backgroundColor1
    let moviesTitle = "Movies List"
    let imageUrlPath = "http://image.tmdb.org/t/p/w500"
    
    let popularMoviesTxt = "Most popular..."
    let nowPlayingMoviesTxt = "Now playing..."
    
    let moviesLblFont = UIFont.boldSystemFont(ofSize: 22)
    let moviesLblTextColor = UIColor.themeColor

    func cancelCatalogsFetch() {
        dataTask?.cancel()
    }
    
    func fetch(moviesRequest: MoviesRequest = MoviesRequest(page: nil), completion: @escaping (Result<([MovieVM]), NetworkError>) -> ()) {
        fetchData(moviesRequest: moviesRequest) { result in
            completion(result)
        }
    }
    
    // MARK: - Inits
    init(isLoadingScreenShown: Bool) {
        self.isLoadingScreenShown = isLoadingScreenShown
    }
    
    // MARK: - Properties
    private var dataTask: URLSessionDataTask?
    private let moviesService = MoviesService()
    
    // MARK: - Helper
    private func fetchData(moviesRequest: MoviesRequest = MoviesRequest(page: nil), completion: @escaping (Result<([MovieVM]), NetworkError>) -> ()) {

        self.dataTask = self.moviesService.fetchNowPlayingMovies(moviesRequest: moviesRequest, completion: { result in
            switch result {

            case .failure(let err):
                completion(.failure(err))
            case .success(let response):
                guard let nowPlayingMoviesResp = response?.results else { return }
                let moviesNowPlayingVMs = nowPlayingMoviesResp.map { MovieVM(movieResponse: $0, imagePath: self.imageUrlPath) }
                completion( .success((moviesNowPlayingVMs)) )
            }
        })
    }
}

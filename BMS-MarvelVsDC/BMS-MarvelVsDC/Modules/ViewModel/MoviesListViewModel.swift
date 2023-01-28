//
//  MoviesListViewModel.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import Foundation

protocol MoviesVMDelegate: AnyObject{
    func didSetMoviesListData()
    func didAPIReceiveFailure(errorMessage: String)
}

class MoviesListViewModel{
    
    enum MovieSections{
        case DC
        case Marvel
    }
    
    var listSections: [MovieSections] = []
    var moviesListResponse: MarvelDCResponse?
    
    weak var delegate: MoviesVMDelegate?
    
    func getMoviesList(){
        MovieAPIManager().getMarvelVsDCList { response in
            self.moviesListResponse = response
            self.setSectionsForList()
            self.delegate?.didSetMoviesListData()
        } onFailure: { error in
            self.delegate?.didAPIReceiveFailure(errorMessage: "\(error.rawValue)")
        }
    }
    
    private func setSectionsForList(){
        listSections.removeAll()
        if (self.moviesListResponse?.marvel?.count ?? 0) > 0{
            self.listSections.append(.Marvel)
        }
        if (self.moviesListResponse?.dc?.count ?? 0) > 0{
            self.listSections.append(.DC)
        }
    }
}

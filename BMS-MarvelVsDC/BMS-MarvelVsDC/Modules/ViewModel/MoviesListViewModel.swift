//
//  MoviesListViewModel.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import Foundation

protocol MoviesVMDelegate: AnyObject{
    func didSetMoviesListData()
}

class MoviesListViewModel{
    
    enum MovieSections{
        case DC
        case Marvel
    }
    
    var listSections: [MovieSections] = []
    var moviesListResponse: MarvelDCResponse?
    
    weak var delegate: MoviesVMDelegate?
    
    var listApiSuccess: (() -> Void)?
    
    func getMoviesList(){
        MovieAPIManager().getMarvelVsDCList { response in
            self.moviesListResponse = response
            self.setSectionsForList()
            self.delegate?.didSetMoviesListData()
        } onFailure: { error in
            print(error.rawValue)
        }
    }
    
    private func setSectionsForList(){
        listSections.removeAll()
        if (self.moviesListResponse?.dc?.count ?? 0) > 0{
            self.listSections.append(.DC)
        }
        if (self.moviesListResponse?.marvel?.count ?? 0) > 0{
            self.listSections.append(.Marvel)
        }
    }
}

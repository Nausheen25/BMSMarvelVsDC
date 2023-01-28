//
//  MarvelDCMoviesListViewController.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import UIKit

class MarvelDCMoviesListViewController: UIViewController {

    //MARK: IBOutlet variable
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel: MoviesListViewModel = {
        let viewModel = MoviesListViewModel()
        viewModel.delegate = self
        return viewModel
    }()
    
    //MARK: - Viewcontroller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialVCSetup()
    }

    private func initialVCSetup(){
        tableViewSetup()
        viewModel.getMoviesList()
    }
    
    private func tableViewSetup(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(cellIdentifier: MovieTableViewCell.cellIdentifier)
        tableView.registerCell(cellIdentifier: HorizontalListTableViewCell.cellIdentifier)
        tableView.separatorStyle = .none
    }

}

//MARK: - UITableViewDataSource
extension MarvelDCMoviesListViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.listSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewModel.listSections[section]{
        case .Marvel:
            return 1
        case .DC:
            return viewModel.moviesListResponse?.dc?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.listSections[indexPath.section]{
        case .DC:
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.cellIdentifier, for: indexPath)
            guard let movieCell = cell as? MovieTableViewCell else {return cell}
            if let movie = viewModel.moviesListResponse?.dc?[indexPath.row]{
                movieCell.updateCellWith(movieData: movie)
            }
            return movieCell
        case .Marvel:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: HorizontalListTableViewCell.cellIdentifier, for: indexPath)
            guard let movieCell = cell as? HorizontalListTableViewCell else {return cell}
            if let movies = viewModel.moviesListResponse?.marvel{
                movieCell.movieList = movies
            }
            return movieCell
        }
    }
}

//MARK: - UITableViewDataSource
extension MarvelDCMoviesListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch viewModel.listSections[section]{
        case .Marvel:
            return "MARVEL"
        case .DC:
            return "DC COMICS"
        }
    }
}

//MARK: - MoviesVMDelegate
extension MarvelDCMoviesListViewController: MoviesVMDelegate{
    
    func didSetMoviesListData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func didAPIReceiveFailure(errorMessage: String) {
        
    }
}

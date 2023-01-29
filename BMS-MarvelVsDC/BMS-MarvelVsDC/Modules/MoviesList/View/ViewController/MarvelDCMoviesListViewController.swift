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
        getDataForMoviesList()
    }
    
    private func tableViewSetup(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(cellIdentifier: MovieTableViewCell.cellIdentifier)
        tableView.registerCell(cellIdentifier: HorizontalListTableViewCell.cellIdentifier)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
    }
    
    private func getDataForMoviesList(){
        self.view.showLoaderView()
        viewModel.getMoviesList()
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let containerVw = UIView()
        let label = UILabel(frame: CGRect(x: 16, y: 0, width: tableView.frame.width - 32, height: 40))
        switch viewModel.listSections[section]{
        case .Marvel:
            label.text = "MARVEL"
        case .DC:
            label.text = "DC COMICS"
        }
        label.textColor = .darkGray
        containerVw.addSubview(label)
        return containerVw
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

//MARK: - MoviesVMDelegate
extension MarvelDCMoviesListViewController: MoviesVMDelegate{
    
    func didSetMoviesListData() {
        DispatchQueue.main.async {
            self.view.hideLoaderView()
            self.tableView.reloadData()
        }
    }
    
    func didAPIReceiveFailure(errorMessage: String) {
        DispatchQueue.main.async {
            self.view.hideLoaderView()
            let errorVw = self.view.showErrorView(errorMessage: errorMessage)
            errorVw.didClickRetry = {
                self.view.removeErrorView()
                self.getDataForMoviesList()
            }
        }
    }
}

//
//  HorizontalListTableViewCell.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import UIKit

class HorizontalListTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlet variables
    @IBOutlet weak var movieCollectionView: UICollectionView!
    
    //MARK: - Helper variables
    var movieList: [MarvelDCResponse.Movies]?{
        didSet{
            movieCollectionView.reloadData()
        }
    }
    
    /// Cell Identifier for reusability
    static var cellIdentifier : String {
        return String(describing: Self.self)
    }
    
    //MARK: - Cell lifecyle
    override func awakeFromNib() {
        super.awakeFromNib()
        initialCellSetup()
    }
    
    private func initialCellSetup(){
        setupCollectionView()
    }
    
    private func setupCollectionView(){
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        movieCollectionView.registerCell(cellIdentifier: MovieCollectionViewCell.cellIdentifier)
    }
    //MARK: - Helper Methods
    
    
    //MARK: - IBAction button
    
    
    //MARK: - Update Methods
    
}

extension HorizontalListTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.cellIdentifier, for: indexPath)
        guard let movieCell = cell as? MovieCollectionViewCell else {return cell}
        if let movie = movieList?[indexPath.row]{
            movieCell.updateCellWith(movieData: movie)
        }
        return movieCell
    }
}

extension HorizontalListTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/1.2, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
}

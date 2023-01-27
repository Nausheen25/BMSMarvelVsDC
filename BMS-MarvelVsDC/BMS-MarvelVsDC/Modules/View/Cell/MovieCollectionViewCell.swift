//
//  MovieCollectionViewCell.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlet variables
    @IBOutlet weak var viewBGContainer: UIView!
    @IBOutlet weak var imageVwMoviePoster: UIView!
    @IBOutlet weak var labelMovieName: UILabel!
    @IBOutlet weak var labelLikesCount: UILabel!
    
    //MARK: - Helper variables
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
        viewBGContainer.addRoundCorner(value: 10)
        imageVwMoviePoster.addRoundCorner(value: 8)
        viewBGContainer.addBorder(color: .black, width: 1.5)
    }
    
    //MARK: - Helper Methods
    
    
    //MARK: - IBAction button
    
    
    //MARK: - Update Methods
    func updateCellWith(movieData: MarvelDCResponse.Movies){
        labelMovieName.text = movieData.name ?? .empty
        labelLikesCount.text = "Likes: \(movieData.likeCount ?? 0)"
    }
}

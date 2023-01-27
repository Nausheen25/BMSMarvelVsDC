//
//  UIImageView+Extension.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import UIKit
import SDWebImage

extension UIImageView{
    func loadImagefrom(_ url: String, placeholderImage: UIImage?){
        guard let imageUrl = URL(string: url) else {
            self.image = placeholderImage
            return
        }
        self.sd_setImage(with: imageUrl, placeholderImage: placeholderImage)
    }
}

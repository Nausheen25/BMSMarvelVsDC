//
//  UITableView+Extension.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import UIKit

extension UITableView {
    func registerCell(cellIdentifier: String, bundle: Bundle = .main) {
        self.register(UINib(nibName: cellIdentifier, bundle: bundle), forCellReuseIdentifier: cellIdentifier)
    }
}

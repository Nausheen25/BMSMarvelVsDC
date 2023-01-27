//
//  UIViewController+Extension.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import Foundation

import UIKit

enum Storyboard: String{
    case Movies
}

extension UIViewController{
    static func instantiateController<T: UIViewController>(storyboard: Storyboard) -> T {
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let controller = (storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as? T)!
        return controller
    }
}
